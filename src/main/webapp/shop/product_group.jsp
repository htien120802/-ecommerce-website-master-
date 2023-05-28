<div>
    <div>
        <a href="view_product?id=${product.productId}">
            <img src="data:image/jpg;base64,${product.base64Image}" alt=""/>
        </a>
    </div>

    <div><a href="view_product?id=${product.productId}"> <b>${product.title}</b></a></div>

    <div>
        <%@ include file="product_rating.jsp" %>
    </div>

    <div><b>$${product.price}</b></div>
</div>