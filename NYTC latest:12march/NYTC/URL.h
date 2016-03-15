//
//  URL.h
//  ecaHUB
//
//  Created by promatics on 2/26/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#ifndef ecaHUB_URL_h
#define ecaHUB_URL_h
/*  response code
 1 => success
 0 => failure
 */

//#define baseURL @"http://europa.promaticstechnologies.com/TasteCard/webservices/"

#define baseURL @"https://nytastecard.com/webservices/"

//#define imageURL @"http://europa.promaticstechnologies.com/TasteCard/img/restaurant_image/"

#define imageURL @"https://nytastecard.com/TasteCard/img/restaurant_image/"

//#define offerThumbURL @"http://europa.promaticstechnologies.com/TasteCard/img/frontend/offers_thumb/"

#define offerThumbURL @"https://nytastecard.com/TasteCard/img/frontend/offers_thumb/"

#define offerFrontEndURL @"https://nytastecard.com/img/frontend/"

#pragma mark - method type

#define Post_Type @"POST"

#define Get_type @"GET"

#endif
