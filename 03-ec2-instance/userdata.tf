data "template_file" "userdata" {
  template = file("${path.cwd}/user-data.tpl")
}