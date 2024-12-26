---
title: "{{ page.name }} - Medbase Store"
description: "{{ page.description }}"
keywords: "{{ page.name }}, Medbase, {{ page.category }}, medical products, healthcare, {{ page.keywords }}"
image: "{{ page.cover_image }}"
id: 3
layout: default
name: "Professional Lab Coat"
category: "Scrubs & Clothing"
price: 39.99
description: "A premium, durable lab coat designed for medical students and professionals. Made from high-quality fabric, this coat offers comfort and protection during long hours in the clinic or lab."
cover_image: "assets/img/products/professional-lab-coat-cover.jpg"
gallery:
  - "assets/img/products/professional-lab-coat-1.jpg"
  - "assets/img/products/professional-lab-coat-2.jpg"
stock: 60
featured: true
sizes:
  - "Small"
  - "Medium"
  - "Large"
  - "X-Large"
  - "XX-Large"
---
{% include product-page.html %}