<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fashion</title>
<!-- Bootstrap CSS (Make sure to link it correctly or use a CDN) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Add custom CSS for animation -->
<style>
    .fade-in {
        animation: fadeIn 1s ease-out;
    }

    .form-control,
    .form-check-input {
        transition: box-shadow 0.3s ease, transform 0.3s ease;
    }

    .form-control:focus,
    .form-check-input:focus {
        box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        transform: scale(1.05);
    }

    .btn-primary {
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    /* Animation for form elements */
    @keyframes fadeIn {
        0% {
            opacity: 0;
            transform: translateY(20px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .form-container {
        animation: fadeIn 1.5s ease-out;
    }
</style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container mt-5 form-container">
        <h2 class="text-center mb-4">Add New Product</h2>
        <form action="addProduct" method="post" class="border p-4 rounded shadow">
            <!-- Product Title -->
            <div class="mb-3">
                <label for="title" class="form-label">Product Title:</label>
                <input type="text" id="title" name="title" class="form-control fade-in" placeholder="Enter product title" required>
            </div>

            <!-- Product Description -->
            <div class="mb-3">
                <label for="description" class="form-label">Product Description:</label>
                <textarea id="description" name="description" class="form-control fade-in" rows="4" placeholder="Enter product description" required></textarea>
            </div>

            <!-- Product Price -->
            <div class="mb-3">
                <label for="price" class="form-label">Product Price:</label>
                <input type="number" id="price" name="price" class="form-control fade-in" step="0.01" placeholder="Enter product price" required>
            </div>

            <!-- Product Type -->
            <div class="mb-3">
                <label class="form-label">Product Type:</label>
                <div>
                    <div class="form-check form-check-inline fade-in">
                        <input class="form-check-input" type="radio" name="type" id="men" value="Men" required>
                        <label class="form-check-label" for="men">Men</label>
                    </div>
                    <div class="form-check form-check-inline fade-in">
                        <input class="form-check-input" type="radio" name="type" id="women" value="Women" required>
                        <label class="form-check-label" for="women">Women</label>
                    </div>
                    <div class="form-check form-check-inline fade-in">
                        <input class="form-check-input" type="radio" name="type" id="boy" value="Boy" required>
                        <label class="form-check-label" for="boy">Boy</label>
                    </div>
                    <div class="form-check form-check-inline fade-in">
                        <input class="form-check-input" type="radio" name="type" id="girl" value="Girl" required>
                        <label class="form-check-label" for="girl">Girl</label>
                    </div>
                </div>
            </div>

            <!-- Product Image -->
            <div class="mb-3">
                <label for="image" class="form-label">Product Image URL:</label>
                <input type="text" id="image" name="imageUrl" class="form-control fade-in" placeholder="Enter image URL" required>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary fade-in">Add Product</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
