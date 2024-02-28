# applications

The application stack include
- ingress-nginx: for public app
- ingress-nginx-admin : for private app
- loki
- promtail
- prometheus
- grafana
- alertmanager

On local cluster:
- ingress-nginx
  http is exposed on local port 8080
  https is exposed on local port 8443
- ingress-nginx-admin
  http is exposed on local port 8081
  https is exposed on local port 8444

Example: To access grafana exposed on ingress-nginx-admin
- http://grafana.127.0.0.1.nip.io:8081/grafana
- http://grafana.127.0.0.1.nip.io:8081/prometheus
- http://grafana.127.0.0.1.nip.io:8081/alertmanager
