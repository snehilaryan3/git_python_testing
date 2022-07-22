
module "backstage_emr_787899997373" {
version = 1.2
source = 'app.terraform.io/fig-tlz/live-resources/aws//emr'custom_ami_id = ami-01b6eb19988ce2dd9
key_name = key_pair_name
security_configuration = name_of_sec_config
configurations_json = data.template_file.configurations.rendered
namespace = local.common_prfix
stage = var.environment
name = local.common_prefix-internal-ds
managed_master_security_group_id = IdOfSecurityGrpMaster
managed_slave_security_group_id = IdOfSecurityGrpSlave
service_access_security_group_id = IdOfSecurityGropuService
instance_profile = InstanceProfile
emr_role_arn = EMR_Role
region = Region
vpc_id = local.vpc_id
subnet_id = local.subnetids[1]
subnet_type = Private
ebs_root_volume_size = 100
visible_to_all_users = true
release_label = rlease
applications = []
core_instance_group_instance_type = r5.xlarge
core_instance_group_instance_count = 4
core_instance_group_ebs_type = gp2
master_instance_group_instance_type = r5.xlarge
master_instance_group_instance_count = 2
master_instance_group_ebs_size = 100
master_instance_group_ebs_type = gp2
master_instance_group_ebs_volumes_per_instance = 4
create_task_instance_group = false
log_uri = format('s3n://%s/emr/', module.logs_bucket.this_s3_bucket_id)
tags = merge(local.tags_resource, { 'Name' = local.common_prefix-name_of_cluster})
bootstrap_action = local.bootstrap_actions_internal
termination_protection = false
tags_context = merge(local.tags_context_va, { 'name' = ${local.common_prefix}- internal-ds', 'tags' = local.tags_conf })
steps = local.confidential_crossaccount_steps
}