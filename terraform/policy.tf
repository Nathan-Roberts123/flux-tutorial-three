resource "aws_iam_role_policy" "external_secrets_ssm_policy" {
  name = "ExternalSecretsSSMPolicy"
  role = aws_iam_role.external_secrets_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath"
        ]
        Resource = [
          "arn:aws:ssm:${var.wallbag_credentials_region}:${data.aws_caller_identity.current.account_id}:parameter/K8s/Wallabag/wallabag-credentials",
          "arn:aws:ssm:${var.wallbag_credentials_region}:${data.aws_caller_identity.current.account_id}:parameter/K8s/Wallabag/wallabag-credentials/*"
        ]
      }
    ]
  })
}

# resource "aws_iam_role_policy_attachment" "external_secrets_role_policy_association" {
#   role       = aws_iam_role.external_secrets_role.name
#   policy_arn = aws_iam_policy.external_secrets_ssm_policy.arn
# }

resource "aws_iam_role_policy_attachment" "amazoneks_ebs_csi_driver_role_policy_association" {
  role       = aws_iam_role.amazoneks_ebs_csi_driver_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEBSCSIDriverPolicyV2"
}

resource "aws_iam_role_policy" "aws_load_balancer_controller_iam_policy" {
  name = "AWSLoadBalancerControllerIAMPolicy"
  role = aws_iam_role.aws-load-balancer-controller_role.id

  policy = file(
  "${path.module}/policies/aws-load-balancer-controller-iam-policy.json.tpl",
  )

}

