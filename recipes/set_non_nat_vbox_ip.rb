# linux
if node["virtualization"] && node["virtualization"]["system"] == "vbox"
  interfaces = node["network"]["interfaces"]
  interface = (interfaces.keys - ["lo", node["network"]["default_interface"]]).first

  unless interface.empty?
    interfaces[interface]["addresses"].each do |ip, params|
      if params["family"] == ("inet")
        node.automatic["ipaddress"] = ip
      end
    end
  end
# windows
elsif node["kernel"] && node["kernel"]["cs_info"] && node["kernel"]["cs_info"]["model"] == "VirtualBox"
  interfaces = node["network"]["interfaces"]
  interface_key = interfaces.keys.last
  node.automatic["ipaddress"] = interfaces[interface_key]["configuration"]["ip_address"][0]
end
