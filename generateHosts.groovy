#!/usr/bin/env groovy
@Grab('org.yaml:snakeyaml:1.18')

import org.yaml.snakeyaml.Yaml
import java.text.SimpleDateFormat

//consts
def HOSTS_PATH = 'ansible/roles/common/files/hosts'
def INVENTORY_PATH = 'ansible/inventory'

class VirtualMachine {
  def name
  def box
  def ipAddress

  def VirtualMachine(def name, def box, def ip) {
    this.name = name
    this.box = box
    this.ipAddress = ip
  }

  def String toString() {
    return "${name} ${box} ${ipAddress}"
  }

  def String getHostsEntry() {
    return "${ipAddress} ${name}"
  }

  def String getInventoryEntry() {
    if (name.contains('centos'))
      return "${name} ansible_user=vagrant"
    else
      return "${name}"
  }
}

//methods
static def replaceFile(String path, String content) {
  println content
  def input = System.console().readLine("Would you like to save changes in ${path}? (y/n)")
  if('y' == input) {
    def sdf = new SimpleDateFormat("yyMMddHHmm")

    def existingFile = new File(path)
    if(existingFile.exists())
      existingFile.renameTo("${path}.${sdf.format(new Date())}")

    def file = new File(path)
    file.write(content)
  }
}

static def List loadVagrantInventory(String path) {
  Yaml parser = new Yaml()
  List inventory = parser.load((path as File).text)
  def virtualMachines = new ArrayList()
  inventory.each {
    virtualMachines.add(new VirtualMachine(it.name, it.box, it.ip))
  }
  return virtualMachines
}


//main
def workVirtualMachines = loadVagrantInventory("vagrant/vagrant-inventory-work.yml")
def homeVirtualMachines = loadVagrantInventory("vagrant/vagrant-inventory-home.yml")

//hosts
def hostsContent = new StringBuilder()
workVirtualMachines.each { vm->
  hostsContent.append(vm.getHostsEntry())
  hostsContent.append('\n')
}
homeVirtualMachines.each { vm->
  hostsContent.append(vm.getHostsEntry())
  hostsContent.append('\n')
}
replaceFile(HOSTS_PATH, hostsContent.toString())

//ansible inventory
def inventoryContent = new StringBuilder()
inventoryContent.append('[work]\n')
workVirtualMachines.each { vm->
  inventoryContent.append(vm.getInventoryEntry())
  inventoryContent.append('\n')
}

inventoryContent.append('\n[home]\n')
homeVirtualMachines.each { vm->
  inventoryContent.append(vm.getInventoryEntry())
  inventoryContent.append('\n')
}

inventoryContent.append('\n[eco:children]\n')
inventoryContent.append('work\n')
inventoryContent.append('home\n')

inventoryContent.append('\n[eco:vars]\n')
inventoryContent.append('ansible_user=ubuntu\n')

inventoryContent.append('\nlocalhost ansible_connection=local\n')
replaceFile(INVENTORY_PATH, inventoryContent.toString())
