output "instance_id" {
  value = aws_instance.myec2.id
}

output "availability_zone" {
  value = aws_instance.myec2.availability_zone
}