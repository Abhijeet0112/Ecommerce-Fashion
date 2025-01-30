<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
<style>
/* Custom range slider styling */
.custom-range-slider {
    -webkit-appearance: none; /* Remove default styling */
    appearance: none;
    height: 8px;
    background: linear-gradient(to right, #17a2b8, #e9ecef); /* Gradient effect */
    border-radius: 5px;
    outline: none;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease-in-out;
}

/* Thumb styling */
.custom-range-slider::-webkit-slider-thumb {
    -webkit-appearance: none;
    appearance: none;
    width: 20px;
    height: 20px;
    background: #17a2b8;
    border: 2px solid #fff;
    border-radius: 50%;
    cursor: pointer;
    transition: transform 0.3s ease-in-out, background-color 0.3s ease-in-out;
}

.custom-range-slider::-webkit-slider-thumb:hover {
    background: #138496;
    transform: scale(1.2);
}

/* Focus effect */
.custom-range-slider:focus::-webkit-slider-thumb {
    background: #138496;
    box-shadow: 0 0 8px rgba(23, 162, 184, 0.8);
}

/* Progress styling for better browser support */
.custom-range-slider::-moz-range-progress {
    background: #17a2b8;
}
.custom-range-slider::-ms-fill-lower {
    background: #17a2b8;
}
.btn-animate {
    transition: transform 0.3s ease;
}

.btn-animate:hover {
    transform: scale(1.1);
}

</style>
<script>
function updateRatingValue(value) {
    // Dynamically update the displayed rating value
    document.getElementById('ratingValueDisplay').textContent = value;
}
</script>

</head>
<body>
<jsp:include page="header.jsp" />
   <div class="container mt-4">
    <h1 class="mb-4 text-center text-primary fw-bold">Product Details</h1>

    <!-- Display product details -->
    <div class="card mb-4 shadow-lg border-0" style="border-radius: 15px; overflow: hidden; transition: transform 0.3s;">
        <div class="card-body">
            <!-- Product Image -->
            <p class="text-center">
                <img 
                    src="${product.imageUrl}" 
                    alt="${product.title}" 
                    class="img-fluid mx-auto d-block rounded" 
                    style="max-height: 400px; object-fit: contain; box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2); transition: transform 0.3s;" 
                    onmouseover="this.style.transform='scale(1.05)'" 
                    onmouseout="this.style.transform='scale(1)'"
                />
            </p>

            <!-- Product Details -->
            <h5 class="card-title text-center fw-bold text-dark">${product.title}</h5>
            <p class="card-text"><strong>Description:</strong> ${product.description}</p>
            <p class="card-text"><strong>Price:</strong> <span class="text-success">${product.price}</span></p>
            <p class="card-text"><strong>Type:</strong> ${product.type}</p>

            <!-- Action Buttons -->
            <div class="text-center">
                <form action="<%=request.getContextPath()%>/deleteProduct" method="post" class="d-inline">
                    <input type="hidden" name="id" value="${product.id}">
                    <button 
                        type="submit" 
                        class="btn btn-danger btn-sm shadow-sm" 
                        style="transition: background-color 0.3s, transform 0.3s;" 
                        onmouseover="this.style.transform='scale(1.1)'; this.style.backgroundColor='#ff4d4d';" 
                        onmouseout="this.style.transform='scale(1)'; this.style.backgroundColor='';">
                        Delete
                    </button>
                </form>
                <form action="<%=request.getContextPath()%>/productUpdate" method="get" class="d-inline">
                    <input type="hidden" name="id" value="${product.id}">
                    <button 
                        type="submit" 
                        class="btn btn-primary btn-sm shadow-sm" 
                        style="transition: background-color 0.3s, transform 0.3s;" 
                        onmouseover="this.style.transform='scale(1.1)'; this.style.backgroundColor='#1a73e8';" 
                        onmouseout="this.style.transform='scale(1)'; this.style.backgroundColor='';">
                        Update
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

	
	<div class="container mt-5 d-flex justify-content-center">
    <div class="col-md-6 col-lg-5">
        <h3 class="mb-4 text-center text-info fw-bold">Add a Review</h3>
        <form action="${pageContext.request.contextPath}/productDetails" method="post" class="needs-validation shadow-lg p-4 rounded" novalidate style="background: #f8f9fa;">
            <input type="hidden" name="id" value="${product.id}">

            <!-- Name Field -->
            <div class="form-group mb-3">
                <label for="name" class="fw-semibold text-dark">Your Name:</label>
                <input 
                    type="text" 
                    class="form-control border border-info shadow-sm" 
                    id="name" 
                    name="name" 
                    value="${param.name}" 
                    required 
                    placeholder="Enter your name"
                    style="transition: box-shadow 0.3s;">
                <div class="invalid-feedback">Please provide your name.</div>
            </div>

            <!-- Rating Field -->
            <div class="form-group mb-3">
                <label for="rating" class="fw-semibold text-dark">Rating (1-5):</label>
                <div class="d-flex align-items-center">
                    <input 
                        type="range" 
                        class="form-control-range custom-range-slider" 
                        id="rating" 
                        name="rating" 
                        min="1" 
                        max="5" 
                        value="3" 
                        step="1" 
                        oninput="updateRatingValue(this.value);" 
                        style="width: 100%; transition: background-color 0.3s, box-shadow 0.3s;">
                    <span id="ratingValueDisplay" class="ms-3 badge bg-info text-white fs-6 shadow-sm" style="min-width: 40px;">3</span>
                </div>
                <div class="invalid-feedback">Please provide a valid rating between 1 and 5.</div>
            </div>

            <!-- Comment Field -->
            <div class="form-group mb-4">
                <label for="comment" class="fw-semibold text-dark">Comment:</label>
                <textarea 
                    class="form-control border border-info shadow-sm" 
                    id="comment" 
                    name="comment" 
                    rows="3" 
                    required 
                    placeholder="Write your comment here..."
                    style="resize: none; transition: box-shadow 0.3s;"></textarea>
                <div class="invalid-feedback">Please provide a comment.</div>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button 
                    type="submit" 
                    class="btn btn-info text-white px-4 fw-bold shadow-sm" 
                    style="transition: background-color 0.3s, transform 0.3s;" 
                    onmouseover="this.style.transform='scale(1.1)'; this.style.backgroundColor='#17a2b8';" 
                    onmouseout="this.style.transform='scale(1)'; this.style.backgroundColor='';">
                    Submit Review
                </button>
            </div>
        </form>
    </div>
</div>


<br>
   <div class="container my-4">
<h1 class="mb-4 text-center">Product Reviews</h1>

    <!-- Display Reviews in Cards -->
    <div class="row row-cols-1 row-cols-md-3 g-4"> <!-- Added Bootstrap classes for better layout -->
    
        <c:if test="${not empty reviews}">
            <c:forEach var="review" items="${reviews}">
                <div class="col mb-4">
                    <div class="card shadow-sm animated fadeInUp">
                        <div class="card-body">
                            <h5 class="card-title">${review.name}</h5>
                            <h6 class="card-subtitle mb-2 text-warning">
                                Rating: ${review.rating} / 5
                            </h6>
                            <p class="card-text">${review.comment}</p>
                            <!-- Add any buttons for update/delete here -->
                            <div class="d-flex justify-content-start gap-2">
                                <!-- Delete Review Button -->
                                <form action="deleteReview" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this review?');">
                                    <input type="hidden" name="rid" value="${review.rid}">
                                    <input type="hidden" name="product_id" value="${product.id}">
                                    <button type="submit" class="btn btn-danger btn-sm btn-animate">Delete</button>
                                </form>
                            
                                <!-- Update Review Button -->
                                <button type="button" class="btn btn-primary btn-sm btn-animate" data-bs-toggle="modal" data-bs-target="#updateReviewModal-${review.rid}">
                                    Update
                                </button>
                            </div>
                            
                            <!-- Update Review Modal -->
                            <div class="modal fade" id="updateReviewModal-${review.rid}" tabindex="-1" aria-labelledby="updateReviewModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="updateReview" method="post">
                                            <input type="hidden" name="rid" value="${review.rid}">
                                            <input type="hidden" name="product_id" value="${product.id}">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateReviewModalLabel">Update Review</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group mb-3">
                                                    <label for="name-${review.rid}" class="form-label">Your Name:</label>
                                                    <input type="text" class="form-control" id="name-${review.rid}" name="name" value="${review.name}" required>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label for="rating-${review.rid}" class="form-label">Rating (1-5):</label>
                                                    <input type="range" class="form-range" id="rating-${review.rid}" name="rating" min="1" max="5" value="${review.rating}" oninput="document.getElementById('ratingValue-${review.rid}').textContent = this.value;" required>
                                                    <small id="ratingValue-${review.rid}" class="form-text text-muted">Selected Rating: ${review.rating}</small>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label for="comment-${review.rid}" class="form-label">Comment:</label>
                                                    <textarea class="form-control" id="comment-${review.rid}" name="comment" rows="3" required>${review.comment}</textarea>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>

        <!-- If no reviews are available -->
        <c:if test="${empty reviews}">
            <div class="alert alert-info animated fadeInUp" role="alert">
                No reviews found for this product.
            </div>
        </c:if>
    </div>
</div>

<!-- Include Bootstrap's CSS and animation CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

</body>
</html>
