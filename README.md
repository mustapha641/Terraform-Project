# Terraform-Project

This project is centered on Terraform as an Infrastructure as Code (IaC) tool for provisioning, managing, and automating cloud infrastructure.

Table of Contents
- [Project Overview](#project-overview)
- [What is Terraform?](#what-is-terraform)
  - [Terraform Core](#terraform-core)
  - [Providers & Provisioners](#providers--provisioners)
    - [State File (.tfstate)](#state-file-tfstate)
- [Repository Structure](#repository-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Quickstart](#quickstart)
- [Best Practices](#best-practices)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

This repository contains Terraform configuration and supporting files to demonstrate and manage cloud infrastructure using IaC principles. The goal is to provide reusable examples and best-practice patterns for managing infrastructure as code.

## What is Terraform?

Terraform is an open-source Infrastructure as Code (IaC) tool that enables engineers to provision, manage, and automate infrastructure using code rather than manual processes. Developed by HashiCorp, Terraform simplifies infrastructure automation across multiple cloud providers.

Before tools like Terraform became popular, cloud infrastructure was often created manually through web consoles. For example, deploying a web application on a cloud platform might involve creating virtual machines, configuring networking, setting up databases, and managing security groups—all through graphical interfaces. This manual approach was error-prone and difficult to version control.

Terraform by HashiCorp stands as the industry standard for open-source Infrastructure as Code (IaC). It provides engineers with the ability to define, provision, and iterate multi-cloud infrastructure efficiently and safely.

### Terraform Core

Terraform Core is the main engine of Terraform. It is the component responsible for reading your Terraform configuration files, understanding what infrastructure you want, determining what changes are needed, and then orchestrating those changes. Core also manages the state file and handles the dependency graph between resources.

### Plugins (Providers and Provisioners)

Terraform Core does not inherently know how an AWS EC2 instance, a Google Cloud storage bucket, or a Kubernetes cluster works. Instead, it relies on Providers.

- **What they are:** Providers are executable binaries that act as translation bridges between Terraform Core and target platform APIs.
- **How they work:** When Core decides it needs to create an AWS server, it asks the AWS Provider plugin via an RPC (Remote Procedure Call) interface. The provider translates that request into a concrete API call to AWS.
- **Extensibility:** Because of this decoupled layout, anyone can write a provider for any service that features a public API.


![Terraform Architecture](images/terraform-architecture.png.png)

How the Declarative Paradigm Works in Practice

When you write a Terraform configuration file, you are defining a target blueprint:

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  count         = 3
}

If you deploy this code, it calculates dynamically. Terraform sees you want 3 servers, checks your cloud provider, finds 0 servers, and deploys 3.  If you change count = 3 to count = 5 a week later and run it again, an imperative script would blindly run the "create server" command again, accidentally leaving you with 8 servers total. Terraform's declarative engine compares your blueprint (5) to reality (3) and says: "I only need to create exactly 2 more to achieve the desired state."
Terraform also automatically handles destruction. If you change the instance type from t2.micro to t2.large, you don't write a script to modify the server. You just change the text in your file. Terraform reads the new target state, realizes the existing servers must be upgraded, and handles the API lifecycle loop to swap them out safely.
Terraform is also self-healing: If an engineer manually logs into the AWS Web Console and deletes one of your three servers, your infrastructure has "drifted." The next time you run terraform plan, Terraform realizes reality (2 servers) no longer matches your declarative code (3 servers). It will automatically recreate the missing server to bring the environment back into alignment.
In summary, Terraform is declarative because you describe what you want the final infrastructure to look like, not how to build it step by step.



![Terraform Architecture](images/terraform-architecture2.png)


