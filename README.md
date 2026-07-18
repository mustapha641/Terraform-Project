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


