from kubernetes import client, config

# Carregar a configuração do kubeconfig
config.load_kube_config()

# Criar a instância do cliente da API do Kubernetes
api_instance = client.CustomObjectsApi()

# Nome do ClusterPolicy a ser excluído
policy_name = "add-ns-quota-v2"

# Nome do grupo de recursos do Kyverno
group = "kyverno.io"

# Nome da versão do recurso
version = "v1"

# Nome do plural do recurso
plural = "clusterpolicies"

# Nome do namespace (no caso de ClusterPolicy, é vazio)
namespace = ""

# Fazer a chamada para excluir o ClusterPolicy
try:
    api_instance.delete_namespaced_custom_object(group, version, namespace, plural, policy_name)
    print(f"ClusterPolicy {policy_name} excluído com sucesso.")
except client.exceptions.ApiException as e:
    print(f"Erro ao excluir o ClusterPolicy: {e}")