import json
import sys

def setResourceName(base_name, resource_type):

    allowed_resource_types = ["virtual_machine", "key_vault", "storage_account"]
    max_name_length = 15
    vm_suffix = "-00"
    vm_prefix = "vm-"
    kv_prefix = "kv-"
    sa_prefix = "sa-"
    resource_name = ""

    if resource_type not in allowed_resource_types:
        print("Not allowed")
    else:
        if resource_type == "virtual_machine":
            max_vmname_length = max_name_length - len(vm_prefix) - len(vm_suffix)
            truncated_base_name = base_name[:max_vmname_length] if len(base_name) > max_vmname_length else base_name
            resource_name = vm_prefix + truncated_base_name + vm_suffix
        if resource_type == "key_vault":
            resource_name = (kv_prefix + base_name).lower()
        
        if resource_type == "storage_account":
            resource_name = (sa_prefix + base_name.replace("-","")).lower()
    #print(resource_name)
    return resource_name

def main():
    return setResourceName(sys.argv[1], sys.argv[2])

if __name__ == '__main__':
    result = main()
    print(json.dumps(result))

