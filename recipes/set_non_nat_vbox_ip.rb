# linux
interfaces = node["network"]["interfaces"]

if node["virtualization"] && node["virtualization"]["system"] == "vbox"
  interface_key = (interfaces.keys - ["lo", node["network"]["default_interface"]]).first

  unless interface_key.empty?
    interfaces[interface_key]["addresses"].each do |ip, params|
      if params["family"] == ("inet")
        node.automatic["ipaddress"] = ip
      end
    end
  end
# windows
elsif node["kernel"] && node["kernel"]["cs_info"] && node["kernel"]["cs_info"]["model"] == "VirtualBox"
  interface_key = interfaces.keys.last
  node.automatic["ipaddress"] = interfaces[interface_key]["configuration"]["ip_address"][0]
end
