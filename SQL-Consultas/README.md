## 🧾 Consulta: Máximo de ventas por región y representante

Esta consulta SQL identifica el representante con mayor volumen de ventas en cada región. Utiliza subconsultas con `WITH`, agregaciones y múltiples `JOIN`
para combinar datos de órdenes, cuentas, representantes y regiones.

🔍 **Objetivo:**  
Obtener el nombre de la región, el representante y el monto máximo de ventas por región.

🛠️ **Técnicas utilizadas:**
- Subconsultas con `WITH`
- `JOIN` entre 4 tablas
- `GROUP BY` y `MAX`
- Filtrado por coincidencia entre totales

🎥 **Video explicativo:** [https://youtu.be/qj0gPMV-8_A]

📂 Archivo: `MAX_BY_REGION.sql`
