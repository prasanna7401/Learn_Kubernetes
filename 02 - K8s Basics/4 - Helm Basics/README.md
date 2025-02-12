![helm-charts-for-template](./screenshots/templates%20using%20helm.png)

**Directory structure**:

```
my-chart/
    - Chart.yml
    - values.yml
    - charts/
    - templates/
```
- `Chart.yml` - contains meta-data information about the chart. Like name, version, dependencies, etc.
- `values.yml` - contains values for template files. You can mention the default values, which you can override later using `--set something=something` argument, or using `--values=<custom-file>.yml`
- `charts/` folder - contains chart dependencies.
- `templates/` folder - contains all your templates.

**How to run?**

```sh
helm install <chart-name>
helm upgrade <chart-name>
helm rollback <chart-name>
```


**Uses**:
- One `values.yml` file will replace multiple yaml files for each similar apps with different properties.
- Very useful in CI/CD for modifying the template based on the run.
- Package multiple yaml files into a single helm package, and deploy them across different environments.
