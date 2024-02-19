CREATE VIEW UserAnalyticsView AS
SELECT
    u.UserID,
    u.Username,
    u.EmailAddress,
    u.IsActive,
    COUNT(DISTINCT fdp.PostID) AS TotalPostsCreated,
    AVG(fr.Rating) AS AvgRatingReceived,
    COUNT(DISTINCT fr.FeedbackRatingID) AS TotalFeedbacksReceived
FROM
    [dbo].[UserAccounts] u
LEFT JOIN
    [dbo].[DonationPosts] fdp ON u.UserID = fdp.UserID
LEFT JOIN
    [dbo].[Comments] c ON u.UserID = c.UserID
LEFT JOIN
    [dbo].[Likes] lt ON u.UserID = lt.UserID
LEFT JOIN
    [dbo].[FeedbackRatings] fr ON u.UserID = fr.RatedUserID
LEFT JOIN
    [dbo].[FeedbackRatings] fr2 ON u.UserID = fr2.RatingUserID
GROUP BY
    u.UserID, u.Username, u.EmailAddress, u.IsActive;

-- select * from UserAnalyticsView; // for executing the view