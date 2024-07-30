resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "test" {
  family                   = "test"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "whoami",
    "image": "stefanscherer/whoami:latest",
    "cpu": 1,
    "memory": 3,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 8080,
        "protocol": "tcp"
      }
    ]
  }
]
TASK_DEFINITION

}

resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.test.arn
  desired_count   = 1
  launch_type = "FARGATE"
    network_configuration {
    subnets          = [aws_subnet.public_subnet.id]
    security_groups   = [aws_security_group.example.id]
    assign_public_ip  = true
  }
}

