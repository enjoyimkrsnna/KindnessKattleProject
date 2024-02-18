
CREATE VIEW DonationPostDetails AS

SELECT 

    dp.PostID,

    dp.UserID,

    u.FirstName + ' ' + u.LastName AS FullName,

    u.Username,

    u.EmailAddress,

    u.ProfileDescription,

    a.AddressLine,

    a.City,

    a.StateRegion,

    a.Longitude,

    a.Latitude,

    dp.FoodImageURL,

    dp.FoodType,

    dp.TimeAvailable,

    dp.IsPostActive,

    dp.CreatedAt,

    ps.PickupStatusID,

    ps.PickedUpByUserID,

    ps.PickupDateTime

FROM 

    DonationPosts dp

JOIN 

    UserAccounts u ON dp.UserID = u.UserID

JOIN 

    Addresses a ON dp.AddressID = a.AddressID

LEFT JOIN 

    PickupStatuses ps ON dp.PostID = ps.PostID;
