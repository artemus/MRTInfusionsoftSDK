//
//  MRTInfusionsoftSDK.h
//  MRTInfusionsoftSDK
//
//  Created by Erdinc Akgunduz on 10/4/13.
//  Copyright (c) 2013 Martsys Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRTInfusionsoftSDK : NSObject

+ (MRTInfusionsoftSDK *)sharedClient;

@property (nonatomic, copy) NSString *appname;
@property (nonatomic, copy) NSString *apikey;

// APIAffiliateService Methods

- (id)apiAffiliateServiceAffClawbacks:(NSUInteger)affiliateID
                            startDate:(NSDate *)startDate
                              endDate:(NSDate *)endDate;


- (id)apiAffiliateServiceAffCommissions:(NSUInteger)affiliateID
                              startDate:(NSDate *)startDate
                                endDate:(NSDate *)endDate;

- (id)apiAffiliateServiceAffPayouts:(NSUInteger)affiliateID
                          startDate:(NSDate *)startDate
                            endDate:(NSDate *)endDate;

- (id)apiAffiliateServiceAffRunningTotals:(NSArray *)affiliateIDs;

- (id)apiAffiliateServiceAffSummary:(NSUInteger)affiliateID
                          startDate:(NSDate *)startDate
                            endDate:(NSDate *)endDate;

- (id)affiliateServiceGetRedirectLinksForAffiliate:(NSUInteger)affiliateID;


// AffiliateProgramService Methods

- (id)affiliateProgramServiceGetAffiliatesByProgram:(NSUInteger)programID;

- (id)affiliateProgramServiceGetProgramsForAffiliate:(NSUInteger)affiliateID;

- (id)affiliateProgramServiceGetAffiliatePrograms;

- (id)affiliateProgramServiceGetResourcesForAffiliateProgram:(NSUInteger)programID;


// ContactService Methods

- (id)contactServiceAdd:(NSArray *)values;

- (id)contactServiceAddToCampaign:(NSUInteger)contactID
                       campaignID:(NSUInteger)campaignID;

- (id)contactServiceAddToGroup:(NSUInteger)contactID
                    campaignID:(NSUInteger)groupID;

// Undocumented, but present in PHP ISDK
- (id)contactServiceApplyActivityHistoryTemplate:(NSUInteger)contactID
                                       historyID:(NSUInteger)historyID
                                          userID:(NSUInteger)userID;

// Undocumented, but present in PHP ISDK
- (id)contactServiceGetActivityHistoryTemplateMap;

// Undocumented, but present in PHP ISDK
- (id)contactServiceGetCampaigneeStepDetails:(NSUInteger)contactID
                              sequenceStepID:(NSUInteger)sequenceStepID;

- (id)contactServiceFindByEmail:(NSString *)email
                         fields:(NSArray *)fields;

- (id)contactServiceLoad:(NSUInteger)contactID
                  fields:(NSArray *)fields;

- (id)contactServiceMerge:(NSUInteger)contactID
       duplicateContactID:(NSUInteger)duplicateContactID;

- (id)contactServiceGetNextCampaignStep:(NSUInteger)contactID
                     followUpSequenceID:(NSUInteger)followUpSequenceID;

- (id)contactServicePauseCampaign:(NSUInteger)contactID
               followUpSequenceID:(NSUInteger)followUpSequenceID;

- (id)contactServiceRemoveFromCampaign:(NSUInteger)contactID
                    followUpSequenceID:(NSUInteger)followUpSequenceID;

- (id)contactServiceRunActionSequence:(NSUInteger)contactID
                          actionSetID:(NSUInteger)actionSetID;

- (id)contactServiceResumeCampaignForContact:(NSUInteger)contactID
                          followUpSequenceID:(NSUInteger)followUpSequenceID;

- (id)contactServiceRescheduleCampaignStep:(NSArray *)contactIDs
                            sequenceStepID:(NSUInteger)sequenceStepID;

- (id)contactServiceAddWithDupCheck:(NSArray *)values
                       dupCheckType:(NSString *)dupCheckType;

- (id)contactServiceUpdate:(NSUInteger)contactID
                    values:(NSArray *)values;


// Undocumented, but present in PHP ISDK

// CreditCardSubmissionService Methods

- (id)creditCardSubmissionServiceRequestSubmissionToken:(NSUInteger)contactID
                                             successUrl:(NSString *)successUrl
                                             failureUrl:(NSString *)failureUrl;

- (id)creditCardSubmissionServiceRequestCreditCardID:(NSString *)token;


// DataService Methods

// Any image data must be base64 encoded before submitting
- (id)dataServiceAdd:(NSString *)table
          withValues:(NSArray *)values;

- (id)dataServiceAddCustomField:(NSString *)customFieldType
                    displayName:(NSString *)displayName
                       dataType:(NSUInteger)dataType
                       headerID:(NSUInteger)headerID;

- (id)dataServiceAuthenticateUser:(NSString *)username
                         password:(NSString *)password;

- (id)dataServiceDelete:(NSString *)table
               recordID:(NSUInteger)recordID;

- (id)dataServiceEcho:(NSString *)text;

- (id)dataServiceFindByField:(NSString *)table
                       limit:(NSUInteger)limit
                        page:(NSUInteger)page
                       field:(NSString *)field
                       value:(NSString *)value
                      fields:(NSArray *)fields;

- (id)dataServiceGetAppointmentICal:(NSUInteger)appointmentId;

- (id)dataServiceGetAppSetting:(NSString *)module
                       setting:(NSString *)setting;

- (id)dataServiceGetTemporaryKey:(NSString *)vendorKey
                        username:(NSString *)username
                        password:(NSString *)password;

- (id)dataServiceLoad:(NSString *)table
             recordID:(NSUInteger)recordID
               fields:(NSArray *)fields;

// Any image data must be base64 encoded before submitting
- (id)dataServiceUpdate:(NSString *)table
               recordID:(NSUInteger)recordID
                 values:(NSArray *)values;

- (id)dataServiceUpdateCustomField:(NSUInteger)fieldID
                            values:(NSArray *)values;

// optional: orderByField, ascending
// ascending : YES | NO
- (id)dataServiceQuery:(NSString *)table
                 limit:(NSUInteger)limit
                  page:(NSUInteger)page
                 query:(NSArray *)query
                fields:(NSArray *)fields
          orderByField:(NSString *)orderByField
             ascending:(BOOL)ascending;


// DiscountService Methods

- (id)discountServiceAddCategoryAssignmentToCategoryDiscount:(NSUInteger)categoryDiscountID
                                           productCategoryID:(NSUInteger)productCategoryID;

- (id)discountServiceAddCategoryDiscount:(NSString *)name
                             description:(NSString *)description
               applyDiscountToCommission:(BOOL)applyDiscountToCommission
                                  amount:(NSDecimalNumber *)amount;

- (id)discountServiceAddFreeTrial:(NSString *)name
                      description:(NSString *)description
                    freetrialDays:(NSUInteger)freetrialDays
                        hidePrice:(BOOL)hidePrice
               subscriptionPlanID:(NSUInteger)subscriptionPlanID;


// percentOrAmount: 0 -> amount | 1 -> Percent
- (id)discountServiceAddOrderTotalDiscount:(NSString *)name
                               description:(NSString *)description
                 applyDiscountToCommission:(BOOL)applyDiscountToCommission
                           percentOrAmount:(NSUInteger)percentOrAmount
                                    amount:(NSDecimalNumber *)amount
                                   payType:(NSString *)paytype;

// percentOrAmount: 0 -> amount | 1 -> Percent
- (id)discountServiceAddProductTotalDiscount:(NSString *)name
                                 description:(NSString *)description
                   applyDiscountToCommission:(BOOL)applyDiscountToCommission
                                   productID:(NSUInteger)productID
                             percentOrAmount:(NSUInteger)percentOrAmount
                                      amount:(NSDecimalNumber *)amount;

// percentOrAmount: 0 -> amount | 1 -> Percent
- (id)discountServiceAddShippingTotalDiscount:(NSString *)name
                                  description:(NSString *)description
                    applyDiscountToCommission:(BOOL)applyDiscountToCommission
                              percentOrAmount:(NSUInteger)percentOrAmount
                                       amount:(NSDecimalNumber *)amount;

- (id)discountServiceGetCategoryAssignmentsForCategoryDiscount:(NSUInteger)categoryDiscountID;

- (id)discountServiceGetCategoryDiscount:(NSUInteger)categoryDiscountID;

- (id)discountServiceGetFreeTrial:(NSUInteger)freeTrialID;

- (id)discountServiceGetOrderTotalDiscount:(NSUInteger)orderID;

- (id)discountServiceGetProductTotalDiscount:(NSUInteger)productID;

- (id)discountServiceGetShippingTotalDiscount:(NSUInteger)shippingTotalDiscountID;


// APIEmailService Methods

- (id)apiEmailServiceAddEmailTemplate:(NSString *)title
                             category:(NSString *)category
                          fromAddress:(NSString *)fromAddress
                            toAddress:(NSString *)toAddress
                          ccAddresses:(NSString *)ccAddresses
                         bccAddresses:(NSString *)bccAddresses
                              subject:(NSString *)subject
                              txtBody:(NSString *)textBody
                             htmlBody:(NSString *)htmlBody
                          contentType:(NSString *)contentType
                         mergeContext:(NSString *)mergeContext;

- (id)apiEmailServiceAttachEmail:(NSUInteger)contactID
                        fromName:(NSString *)fromName
                     fromAddress:(NSString *)fromAddress
                       toAddress:(NSString *)toAddress
                     ccAddresses:(NSString *)ccAddresses
                    bccAddresses:(NSString *)bccAddresses
                     contentType:(NSString *)contentType
                         subject:(NSString *)subject
                        htmlBody:(NSString *)htmlBody
                         txtBody:(NSString *)textBody
                          header:(NSString *)header
                    receivedDate:(NSDate *)receivedDate
                        sentDate:(NSDate *)sentDate
                   emailSentType:(NSUInteger)emailSentType;

// Undocumented, but present in PHP ISDK
- (id)apiEmailServiceGetAvailableMergeFields:(NSString *)mergeContext;

- (id)apiEmailServiceGetEmailTemplate:(NSUInteger)templateID;

- (id)apiEmailServiceGetOptStatus:(NSString *)email;

- (id)apiEmailServiceOptIn:(NSString *)email
               optInReason:(NSString *)optInReason;

- (id)apiEmailServiceOptOut:(NSString *)email
               optOutReason:(NSString *)optOutReason;

- (id)apiEmailServiceSendEmail:(NSArray *)contactList
                   fromAddress:(NSString *)fromAddress
                     toAddress:(NSString *)toAddress
                   ccAddresses:(NSString *)ccAddresses
                  bccAddresses:(NSString *)bccAddresses
                   contentType:(NSString *)contentType
                       subject:(NSString *)subject
                      htmlBody:(NSString *)htmlBody
                       txtBody:(NSString *)textBody
                    templateID:(NSUInteger)templateID;

- (id)apiEmailServiceSendTemplate:(NSArray *)contactList
                       templateID:(NSUInteger)templateID;

- (id)apiEmailServiceUpdateEmailTemplate:(NSUInteger)templateID
                                   title:(NSString *)title
                              categories:(NSString *)categories
                             fromAddress:(NSString *)fromAddress
                               toAddress:(NSString *)toAddress
                               ccAddress:(NSString *)ccAddress
                              bccAddress:(NSString *)bccAddress
                                 subject:(NSString *)subject
                                textBody:(NSString *)textBody
                                htmlBody:(NSString *)htmlBody
                             contentType:(NSString *)contentType
                            mergeContext:(NSString *)mergeContext;


// FileService Methods

- (id)fileServiceGetDownloadUrl:(NSUInteger)fileID;

- (id)fileServiceGetFile:(NSUInteger)fileID;

- (id)fileServiceRenameFile:(NSUInteger)fileID
                   fileName:(NSString *)fileName;

- (id)fileServiceReplaceFile:(NSUInteger)fileID
           base64EncodedData:(NSString *)base64EncodedData;

// contactID: optional
- (id)fileServiceUploadFile:(NSUInteger)contactID
                   filename:(NSString *)fileName
          base64EncodedData:(NSString *)base64EncodedData;


// FunnelService Methods

- (id)funnelServiceAchieveGoal:(NSString *)integration
                      callName:(NSString *)callName
                     contactID:(NSUInteger)contactID;


// InvoiceService Methods

- (id)invoiceServiceAddManualPayment:(NSUInteger)invoiceID
                              amount:(NSDecimalNumber *)amount
                         paymentDate:(NSDate *)paymentDate
                         paymentType:(NSString *)paymentType
                  paymentDescription:(NSString *)paymentDescription
                   bypassCommissions:(BOOL)bypassCommissions;

- (id)invoiceServiceAddOrderCommissionOverride:(NSUInteger)invoiceID
                                   affiliateID:(NSUInteger)affiliateID
                                     productID:(NSUInteger)productID
                                    percentage:(NSUInteger)percentage
                                        amount:(NSDecimalNumber *)amount
                                    payoutType:(NSUInteger)payoutType
                                   description:(NSString *)description
                                          date:(NSDate *)date;

// type:    1  -> Shipping
//          2  -> Tax
//          3  -> Service & Misc.
//          4  -> Product
//          5  -> Upsell Product
//          6  -> Finance Charge
//          7  -> Special
//          8  -> Program
//          9  -> Subscription Plan
//          10 -> Special : Free Trial Days
//          12 -> Special : Order Total
//          13 -> Special : Category
//          14 -> Special : Shipping

- (id)invoiceServiceAddOrderItem:(NSUInteger)invoiceID
                       productID:(NSUInteger)productID
                            type:(NSUInteger)type
                           price:(NSDecimalNumber *)price
                        quantity:(NSUInteger)quantity
                     description:(NSString *)description
                           notes:(NSString *)notes;

- (id)invoiceServiceAddPaymentPlan:(NSUInteger)invoiceID
                        autoCharge:(BOOL)autoCharge
                      creditCardID:(NSUInteger)creditCardID
                 merchantAccountID:(NSUInteger)merchantAccountID
                  daysBetweenRetry:(NSUInteger)daysBetweenRetry
                          maxRetry:(NSUInteger)maxRetry
              initialPaymentAmount:(NSDecimalNumber *)initialPaymentAmount
                initialPaymentDate:(NSDate *)initialPaymentDate
                     planStartDate:(NSDate *)planStartDate
                  numberOfPayments:(NSUInteger)numberOfPayments
               daysBetweenPayments:(NSUInteger)daysBetweenPayments;

- (id)invoiceServiceAddRecurringOrder:(NSUInteger)contactID
                       allowDuplicate:(BOOL)allowDuplicate
                           cProgramID:(NSUInteger)cProgramID
                             quantity:(NSUInteger)quantity
                                price:(NSDecimalNumber *)price
                              taxable:(BOOL)taxable
                    merchantAccountID:(NSUInteger)merchantAccountID
                         creditCardID:(NSUInteger)creditCardID
                          affiliateID:(NSUInteger)affiliateID
                       daysTillCharge:(NSUInteger)daysTillCharge;

// Convenience method to add recurring order without quantity, price and tax
- (id)invoiceServiceAddRecurringOrderSimple:(NSUInteger)contactID
                             allowDuplicate:(BOOL)allowDuplicate
                                 cProgramID:(NSUInteger)cProgramID
                          merchantAccountID:(NSUInteger)merchantAccountID
                               creditCardID:(NSUInteger)creditCardID
                                affiliateID:(NSUInteger)affiliateID
                             daysTillCharge:(NSUInteger)daysTillCharge;


- (id)invoiceServiceAddRecurringCommissionOverride:(NSUInteger)recurringOrderID
                                       affiliateID:(NSUInteger)affiliateID
                                            amount:(NSDecimalNumber *)amount
                                        payoutType:(NSUInteger)payoutType
                                       description:(NSString *)description;

- (id)invoiceServiceCalculateAmountOwed:(NSUInteger)invoiceID;

- (id)invoiceServiceChargeInvoice:(NSUInteger)invoiceID
                            notes:(NSString *)notes
                     creditCardID:(NSUInteger)creditCardID
                merchantAccountID:(NSUInteger)merchantAccountID
                bypassCommissions:(BOOL)bypassCommissions;

- (id)invoiceServiceCreateBlankOrder:(NSUInteger)contactID
                         description:(NSString *)description
                           orderDate:(NSDate *)orderDate
                    leadAffilliateID:(NSUInteger)leadAffilliateID
                   salesAffilliateID:(NSUInteger)salesAffilliateID;

- (id)invoiceServiceCreateInvoiceForRecurring:(NSUInteger)recurringOrderID;

- (id)invoiceServiceDeleteInvoice:(NSUInteger)invoiceID;

- (id)invoiceServiceDeleteSubscription:(NSUInteger)recurringOrderID;

- (id)invoiceServiceGetAllPaymentOptions;

- (id)invoiceServiceGetAllShippingOptions;

// Undocumented, but present in PHP ISDK
// Get an Invoice ID attached to a one-time order
- (id)invoiceServiceGetInvoiceID:(NSUInteger)orderID;

// Undocumented, but present in PHP ISDK
// Get the Order ID associated with an Invoice
- (id)invoiceServiceGetOrderID:(NSUInteger)invoiceID;

- (id)invoiceServiceGetPayments:(NSUInteger)invoiceID;

// Undocumented, but present in PHP ISDK
- (id)invoiceServiceGetPluginStatus:(NSString *)className;

- (id)invoiceServiceLocateExistingCard:(NSUInteger)contactID
                                 last4:(NSString *)last4;

- (id)invoiceServiceRecalculateTax:(NSUInteger)invoiceID;

// Undocumented, but present in PHP ISDK
- (id)invoiceServiceSetInvoiceSyncStatus:(NSUInteger)invoiceID
                              syncStatus:(BOOL)syncStatus;

// Undocumented, but present in PHP ISDK
- (id)invoiceServiceSetPaymentSyncStatus:(NSUInteger)paymentID
                              syncStatus:(BOOL)syncStatus;

- (id)invoiceServiceUpdateJobRecurringNextBillDate:(NSUInteger)recurringOrderID
                                      nextBillDate:(NSDate *)nextBillDate;

- (id)invoiceServiceValidateExistingCreditCard:(NSUInteger)creditCardID;

- (id)invoiceServiceValidateNewCreditCard:(NSString *)cardType
                                contactID:(NSUInteger)contactID
                               cardNumber:(NSString *)cardNumber
                          expirationMonth:(NSString *)expirationMonth
                           expirationYear:(NSString *)expirationYear
                                     cvv2:(NSString *)cvv2;


// OrderService Methods

- (id)orderServicePlaceOrder:(NSUInteger)contactID
                creditCardID:(NSUInteger)creditCardID
               paymentPlanID:(NSUInteger)paymentPlanID
                  productIDs:(NSArray *)productIDs
         subscriptionPlanIDs:(NSArray *)subscriptionPlanIDs
             processSpecials:(BOOL)processSpecials
                  promoCodes:(NSArray *)promoCodes
             leadAffiliateID:(NSUInteger)leadAffiliateID
             saleAffiliateID:(NSUInteger)saleAffiliateID;


// ProductService Methods

- (id)productServiceDeactivateCreditCard:(NSUInteger)creditCardID;

- (id)productServiceDecreaseInventory:(NSUInteger)productID
                             quantity:(NSUInteger)quantity;

- (id)productServiceDecrementInventory:(NSUInteger)productID;

- (id)productServiceGetInventory:(NSUInteger)productID;

- (id)productServiceIncreaseInventory:(NSUInteger)productID
                             quantity:(NSUInteger)quantity;

- (id)productServiceIncrementInventory:(NSUInteger)productID;


// SearchService Methods

- (id)searchServiceGetAllReportColumns:(NSUInteger)savedSearchID
                                userID:(NSUInteger)userID;

- (id)searchServiceGetAvailableQuickSearches:(NSUInteger)userID;

- (id)searchServiceGetDefaultQuickSearch:(NSUInteger)userID;

- (id)searchServiceGetSavedSearchResultsAllFields:(NSUInteger)savedSearchID
                                           userID:(NSUInteger)userID
                                       pageNumber:(NSUInteger)pageNumber;

- (id)searchServiceGetSavedSearchResults:(NSUInteger)savedSearchID
                                  userID:(NSUInteger)userID
                              pageNumber:(NSUInteger)pageNumber
                            returnFields:(NSArray *)returnFields;

- (id)searchServiceQuickSearch:(NSUInteger)quickSearchType
                        userID:(NSUInteger)userID
                    searchData:(NSString *)searchData
                          page:(NSUInteger)page
                         limit:(NSUInteger)limit;


// ShippingService Methods

- (id)shippingServiceGetAllShippingOptions;

- (id)shippingServiceGetFlatRateShippingOption:(NSUInteger)optionID;

- (id)shippingServiceGetOrderTotalShippingOption:(NSUInteger)optionID;

- (id)shippingServiceGetOrderTotalShippingRanges:(NSUInteger)optionID;

- (id)shippingServiceGetOrderQuantityShippingOption:(NSUInteger)optionID;

- (id)shippingServiceGetProductBasedShippingOption:(NSUInteger)optionID;

// Undocumented, but present in PHP ISDK
- (id)shippingServiceGetProductShippingPricesForProductShippingOption:(NSUInteger)optionID;

- (id)shippingServiceGetUpsShippingOption:(NSUInteger)optionID;

- (id)shippingServiceGetWeightBasedShippingOption:(NSUInteger)optionID;


// WebFormService Methods

- (id)webFormServiceGetMap;

- (id)webFormServiceGetHTML:(NSUInteger)webFormID;


// UNDOCUMENTED WebTrackingService Methods

- (id)webTrackingServiceGetWebTrackingScriptTag;

- (id)webTrackingServiceGetWebTrackingScriptUrl;

@end