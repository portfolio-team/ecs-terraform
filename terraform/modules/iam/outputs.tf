output "execution_role_arn" {
    description = "arn of execution IAM role"
    value = aws_iam_role.default.arn
}

output "task_role_arn" {
    description = "arn of task IAM role"
    value = aws_iam_role.task_role.arn
}