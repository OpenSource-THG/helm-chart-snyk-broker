# helm-chart-snyk-broker

Helm chart used to deploy a [Snyk Broker](https://github.com/snyk/broker) into Kubernetes. Currently only supports GitLab as the SCM.

### Requirements
This chart sets up access to the Snyk Broker service through a [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) 
meaning that the cluster you deploy to needs to have an [Ingress Controller](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)
installed and its TLS certs set up under ``.

### Installing the Chart

To install the chart with the release name `my-broker-release`:

```bash
helm upgrade [-i] --name my-broker-release . --namespace=<NAMESPACE>
```

### Uninstalling the Chart

To uninstall the `my-broker-release` deployment:
```bash
helm delete my-broker-release
```

### Configuration
The following table lists the configurable parameters of the Event Exporter chart and their default values.

| Parameter             | Description                                                                                                          | Default value                                                                                      |
| :-------------------- | :------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------- |
| `name`                | Deployment name                                                                                                      | `snyk-broker`                                                                                      |
| `image.tag`           | Broker image tag                                                                                                     | `4.71.0-gitlab`                                                                                    |
| `image.repository`    | Name of the repository to pull the Broker image from                                                                 | `snyk`                                                                                             |
| `image.name`          | Broker image name                                                                                                    | `broker`                                                                                           |
| `image.pullPolicy`    | Pull policy for the image                                                                                            | `IfNotPresent`                                                                                     |
| `replicas`            | Number of Broker replicas the cluster should aim to have running at once                                             | `1`                                                                                                |
| `resources`           | CPU/memory resource requests/limits for the Broker                                                                   | `{ "requests": { "cpu": "200", "memory": "200Mi"}, "limits": { "cpu": "300", "memory": "300Mi" }}` |
| `gitlab.url`          | Hostname of your GitLab deployment                                                                                   | None                                                                                               |
| `gitlab.token`        | GitLab personal access token with `api` scope                                                                        | None                                                                                               |
| `broker.scheme`       | Scheme to prepend to `broker.url` when providing the full address as an environment variable to the Broker instance. | `https://`                                                                                         |
| `broker.url`          | The address at which the Broker client will be accessible                                                            | None                                                                                               |
| `broker.token`        | Snyk Broker token                                                                                                    | None                                                                                               |
| `port`                | Port at which the Broker client accepts connections. This is only used internally and should not affect the Ingress. | `8000`                                                                                             |
| `ca`                  | Location (within the Broker image) to provide an internal CA certificate.                                            | None                                                                                               |
| `ingress.hosts`       | Service host names to be used in the service Ingress                                                                 | None                                                                                               |
| `ingress.annotations` | Any annotations to be provided to the Broker Ingress                                                                 | None                                                                                               |
