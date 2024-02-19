CREATE FUNCTION GetUserDetailsWithStats
(
    @UserID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        u.*,
        (SELECT AVG(Rating) FROM FeedbackRatings WHERE RatedUserID = @UserID) AS AverageRating,
        (SELECT COUNT(*) FROM DonationPosts WHERE UserID = @UserID) AS TotalDonations,
        (SELECT COUNT(*) FROM PickupStatuses ps 
         JOIN DonationPosts dp ON ps.PostID = dp.PostID 
         WHERE dp.UserID = @UserID AND ps.PickedUpByUserID IS NULL) AS TotalUnsuccessfulStatus
    FROM 
        UserAccounts u
    WHERE 
        u.UserID = @UserID
);