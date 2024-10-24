//SPDX-Licence-Identifier: MIT
pragma solidity 0.8.28;

contract Review{
    struct reviewData{
        string reviewerName;
        string reviewText;
        uint256 rating;
    }

    reviewData[] public reviews;

    event ReviewCreated(string reviewerName,string reviewText,uint256 rating);

    function createReview(string memory _reviewerName,string memory _reviewText,uint256 _rating) public {
        require(_rating >=1 && _rating <=5, "Rating must be between 1 and 5");

        reviews.push(reviewData({
            reviewerName: _reviewerName,
            reviewText: _reviewText,
            rating: _rating

        }));

        emit ReviewCreated(_reviewerName,_reviewText,_rating);
    }

    function getReview(uint256 _index) public view returns (string memory, string memory, uint256) {
        require(_index < reviews.length, "Review not found");
        reviewData memory review = reviews[_index];
        return  (review.reviewerName,review.reviewText,review.rating);
    }

    function getReviewCount() public view returns ( uint256){
        return reviews.length;
    }

}