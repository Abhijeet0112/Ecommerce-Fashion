<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Fashion</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        /* Custom CSS for animations and hover effects */
        .hero-carousel img {
            height: 70vh;
            object-fit: cover;
        }
        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
        }
        .scroll-animation {
            opacity: 0;
            transform: translateY(50px);
            transition: all 0.5s ease-in-out;
        }
        .scroll-visible {
            opacity: 1;
            transform: translateY(0);
        }
        .scroll-animation h2 {
            font-size: 2.5rem;
            font-weight: bold;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: zoomIn 1s ease-in-out;
        }
        .scroll-animation h2:hover {
            animation: pulse 1s infinite;
        }
        @keyframes zoomIn {
            from {
                transform: scale(0.8);
                opacity: 0.8;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }
        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }
        .divider {
            height: 4px;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            margin: 10px auto;
            width: 150px;
            border-radius: 2px;
        }
    </style>
    <script>
        // JavaScript for scroll animations
        document.addEventListener("DOMContentLoaded", function () {
            const animatedElements = document.querySelectorAll('.scroll-animation');
            const observer = new IntersectionObserver(
                entries => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            entry.target.classList.add('scroll-visible');
                        }
                    });
                },
                { threshold: 0.2 }
            );
            animatedElements.forEach(element => observer.observe(element));
        });
    </script>
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <!-- Featured Products Section -->
    <div class="container my-5">
        <div class="text-center scroll-animation">
            <h2>Featured Products</h2>
            <div class="divider"></div>
        </div>
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4 mb-4 scroll-animation">
                    <div class="card shadow-sm h-100">
                        <img src="${product.imageUrl}" class="card-img-top" alt="${product.title}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">
                                <a href="productDetails?id=${product.id}" class="text-dark font-weight-bold" style="text-decoration: none;">
                                    ${product.title}
                                </a>
                            </h5>
                            <p class="card-text text-muted">${product.description}</p>
                            <p class="card-text"><strong>Type:</strong> ${product.type}</p>
                            <p class="card-text"><strong>Price:</strong> ₹${product.price}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
