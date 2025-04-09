# 🛠️ Tuning de Performance para Debian 12
Este projeto fornece um script completo de otimização de performance e estabilidade para **Debian 12**, com foco em:

- 🔧 Ajustes de kernel
- ⚡ Alta performance de rede
- 📶 Otimizações TCP/IP
- 📈 Estabilidade para servidores críticos, ISPs, proxies, VPNs, etc.

---

## 📦 O que é otimizado

✅ `sysctl` para desempenho de rede, arquivos e memória  
✅ Aumento do limite de arquivos (`nofile`) para até 1 milhão  
✅ Melhoria de cache, buffers e filas  
✅ Desativação opcional do IPv6  
✅ Segurança básica via parâmetros do kernel

---

## 🧰 Requisitos

- Sistema: **Debian 12**
- Acesso root

---

## 🚀 Instalação
1. Clone este repositório:
```bash
git clone https://github.com/vandersondiniznoc/debian-tuning.git
cd debian-tuning
```
Dê permissão e execute o script:
```bash
chmod +x tune_debian12.sh
sudo ./tune_debian12.sh
```
Reinicie o sistema para garantir que os novos limites sejam aplicados:
```bash
sudo reboot
```

⚠️ Observações
- A desativação do IPv6 é opcional. Edite o script e comente as linhas net.ipv6.conf.* se você utiliza IPv6.
- O limite de arquivos (nofile) foi elevado para 1 milhão. Isso é importante para servidores que mantêm muitas conexões simultâneas.

📂 Estrutura
.
├── tune_debian12.sh      # Script de tuning principal
└── README.md             # Este guia

## 🧑‍💻 Autor
**Vanderson Diniz do Nascimento**  
Especialista em Linux, Redes, Cibersegurança e ISPs  

- 🌐 [Site pessoal](https://vandersondiniz.com.br)  
- 🏢 [ISPLAB](https://isplab.com.br)  
- 💼 [LinkedIn](https://www.linkedin.com/in/vdnascdiniz/)  
- 💻 [GitHub @vandersondiniznoc](https://github.com/vandersondiniznoc)

📄 Licença
Este projeto está licenciado sob a MIT License.
