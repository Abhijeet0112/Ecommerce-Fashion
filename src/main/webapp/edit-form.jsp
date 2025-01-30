<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link rel="stylesheet" href="styles.css"> <!-- Optional stylesheet -->
</head>
<body>
       <jsp:include page="header.jsp" />
    <div class="container mt-5">
        <h2 class="text-center mb-4">Edit Product</h2>


        <form action="<%=request.getContextPath()%>/productUpdate" method="post" class="border p-4 rounded shadow">
            <input type="hidden" name="id" value="${product.id}" /> 

            <div class="mb-3">
                <label for="title" class="form-label">Product Title:</label>
                <input type="text" id="title" name="title" class="form-control" value="${product.title}" required />
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Product Description:</label>
                <textarea id="description" name="description" class="form-control" rows="4" required>${product.description}</textarea>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Product Price:</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" value="${product.price}" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Product Type:</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" id="men" value="Men" <c:if test="${product.type == 'Men'}">checked</c:if> />
                        <label class="form-check-label" for="men">Men</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" id="women" value="Women" <c:if test="${product.type == 'Women'}">checked</c:if> />
                        <label class="form-check-label" for="women">Women</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" id="boy" value="Boy" <c:if test="${product.type == 'Boy'}">checked</c:if> />
                        <label class="form-check-label" for="boy">Boy</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" id="girl" value="Girl" <c:if test="${product.type == 'Girl'}">checked</c:if> />
                        <label class="form-check-label" for="girl">Girl</label>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="image" class="form-label">Product Image URL:</label>
                <input type="text" id="image" name="image_url" class="form-control" value="${product.imageUrl}" required />
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Update Product</button>
            </div>
        </form>
    </div>
</body>
</html>
