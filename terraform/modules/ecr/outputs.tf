output "repository_uri" {
    description = "ecr repository uri"
    value = aws_ecr_repository.default.repository_url
}