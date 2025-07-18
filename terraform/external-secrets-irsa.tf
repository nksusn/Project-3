 module "external_secrets_irsa" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name = "eso-irsa"
  attach_external_secrets_policy = true

  oidc_providers = {
    main = {
      provider_arn = module.eks.oidc_provider_arn
      namespace_service_accounts = [
        "external-secrets:external-secrets"
      ]
    }
  }
}
