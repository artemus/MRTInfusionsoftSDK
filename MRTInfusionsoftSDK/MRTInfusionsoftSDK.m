//
//  MRTInfusionsoftSDK.m
//  MRTInfusionsoftSDK
//
//  Created by Erdinc Akgunduz on 10/4/13.
//  Copyright (c) 2013 Martsys Software. All rights reserved.
//

#import <xmlrpc/XMLRPC.h>
#import "MRTInfusionsoftSDK.h"
#import "NSString+MRTHash.h"

@implementation MRTInfusionsoftSDK

+ (MRTInfusionsoftSDK *)sharedClient
{
    static MRTInfusionsoftSDK *_singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[MRTInfusionsoftSDK alloc] init];
    });
    return _singleton;
}

// URL Helper Method - Private

- (NSURL *)endpointURLForAppname:(NSString *)appname
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://%@.infusionsoft.com/api/xmlrpc", appname]];
}

-(id)callServiceMethod:(NSString *)serviceMethod withParameters:(NSArray *)values
{
    return [self callServiceMethod:serviceMethod withParameters:values useKey:YES];
    
}

-(id)callServiceMethod:(NSString *)serviceMethod withParameters:(NSArray *)values useKey:(BOOL)useKey
{
    NSArray *methodParameters = values;
    
    if (useKey) {
        methodParameters = [@[self.apikey] arrayByAddingObjectsFromArray:values];
    }
    
    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL:[self endpointURLForAppname:self.appname]];
    
    [request setMethod:serviceMethod withParameters:methodParameters];
    
    NSError *error;
    
    XMLRPCResponse *response = [XMLRPCConnection sendSynchronousXMLRPCRequest:request error:&error];
    
    if (error) {
        // Handle error here
    }
    
    return response.object;
    
}


#pragma mark APIAffiliateService

// APIAffiliateService.affClawbacks

- (id)apiAffiliateServiceAffClawbacks:(NSUInteger)affiliateID
                            startDate:(NSDate *)startDate
                              endDate:(NSDate *)endDate
{
    NSArray *valuesArray = @[@(affiliateID), startDate, endDate];
    return [self callServiceMethod:@"APIAffiliateService.affClawbacks" withParameters:valuesArray];
}

// APIAffiliateService.affCommissions

- (id)apiAffiliateServiceAffCommissions:(NSUInteger)affiliateID
                              startDate:(NSDate *)startDate
                                endDate:(NSDate *)endDate
{
    NSArray *valuesArray = @[@(affiliateID), startDate, endDate];
    return [self callServiceMethod:@"APIAffiliateService.affCommissions" withParameters:valuesArray];
}

// APIAffiliateService.affPayouts

- (id)apiAffiliateServiceAffPayouts:(NSUInteger)affiliateID
                          startDate:(NSDate *)startDate
                            endDate:(NSDate *)endDate
{
    NSArray *valuesArray = @[@(affiliateID), startDate, endDate];
    return [self callServiceMethod:@"APIAffiliateService.affPayouts" withParameters:valuesArray];
}

// APIAffiliateService.affRunningTotals

- (id)apiAffiliateServiceAffRunningTotals:(NSArray *)affiliateIDs
{
    NSArray *valuesArray = @[affiliateIDs];
    return [self callServiceMethod:@"APIAffiliateService.affRunningTotals" withParameters:valuesArray];
}

// APIAffiliateService.affSummary

- (id)apiAffiliateServiceAffSummary:(NSUInteger)affiliateID
                          startDate:(NSDate *)startDate
                            endDate:(NSDate *)endDate
{
    NSArray *valuesArray = @[@(affiliateID), startDate, endDate];
    return [self callServiceMethod:@"APIAffiliateService.affSummary" withParameters:valuesArray];
}

// AffiliateService.getRedirectLinksForAffiliate

- (id)affiliateServiceGetRedirectLinksForAffiliate:(NSUInteger)affiliateID
{
    NSArray *valuesArray = @[@(affiliateID)];
    return [self callServiceMethod:@"AffiliateService.getRedirectLinksForAffiliate" withParameters:valuesArray];
}


#pragma mark - AffiliateProgramService

// AffiliateProgramService.getAffiliatesByProgram

- (id)affiliateProgramServiceGetAffiliatesByProgram:(NSUInteger)programID
{
    NSArray *valuesArray = @[@(programID)];
    return [self callServiceMethod:@"AffiliateProgramService.getAffiliatesByProgram" withParameters:valuesArray];
}

// AffiliateProgramService.getProgramsForAffiliate

- (id)affiliateProgramServiceGetProgramsForAffiliate:(NSUInteger)affiliateID
{
    NSArray *valuesArray = @[@(affiliateID)];
    return [self callServiceMethod:@"AffiliateProgramService.getProgramsForAffiliate" withParameters:valuesArray];
}

// AffiliateProgramService.getAffiliatePrograms

- (id)affiliateProgramServiceGetAffiliatePrograms
{
    NSArray *valuesArray = @[];
    return [self callServiceMethod:@"AffiliateProgramService.getAffiliatePrograms" withParameters:valuesArray];
}

// AffiliateProgramService.getResourcesForAffiliateProgram

- (id)affiliateProgramServiceGetResourcesForAffiliateProgram:(NSUInteger)programID
{
    NSArray *valuesArray = @[@(programID)];
    return [self callServiceMethod:@"AffiliateProgramService.getAffiliatesByProgram" withParameters:valuesArray];
}


#pragma mark - ContactService

// ContactService.add

- (id)contactServiceAdd:(NSArray *)values
{
    NSArray *valuesArray = values;
    return [self callServiceMethod:@"ContactService.add" withParameters:valuesArray];
}

// ContactService.addToCampaign

- (id)contactServiceAddToCampaign:(NSUInteger)contactID campaignID:(NSUInteger)campaignID
{
    NSArray *valuesArray = @[@(contactID), @(campaignID)];
    return [self callServiceMethod:@"ContactService.addToCampaign" withParameters:valuesArray];
}

// ContactService.addToGroup

- (id)contactServiceAddToGroup:(NSUInteger)contactID campaignID:(NSUInteger)groupID
{
    NSArray *valuesArray = @[@(contactID), @(groupID)];
    return [self callServiceMethod:@"ContactService.addToGroup" withParameters:valuesArray];
}

// ContactService.applyActivityHistoryTemplate

- (id)contactServiceApplyActivityHistoryTemplate:(NSUInteger)contactID
                                       historyID:(NSUInteger)historyID
                                          userID:(NSUInteger)userID
{
    NSArray *valuesArray = @[@(contactID), @(historyID), @(userID)];
    return [self callServiceMethod:@"ContactService.applyActivityHistoryTemplate" withParameters:valuesArray];
}

//- ContactService.getActivityHistoryTemplateMap

- (id)contactServiceGetActivityHistoryTemplateMap
{
    NSArray *valuesArray = @[];
    return [self callServiceMethod:@"ContactService.getActivityHistoryTemplateMap" withParameters:valuesArray];
}

// ContactService.getCampaigneeStepDetails

- (id)contactServiceGetCampaigneeStepDetails:(NSUInteger)contactID
                              sequenceStepID:(NSUInteger)sequenceStepID
{
    NSArray *valuesArray = @[@(contactID), @(sequenceStepID)];
    return [self callServiceMethod:@"ContactService.getCampaigneeStepDetails" withParameters:valuesArray];
}

// ContactService.findByEmail

- (id)contactServiceFindByEmail:(NSString *)email fields:(NSArray *)fields
{
    NSArray *valuesArray = @[email, fields];
    return [self callServiceMethod:@"ContactService.findByEmail" withParameters:valuesArray];
}

// ContactService.load

- (id)contactServiceLoad:(NSUInteger)contactID fields:(NSArray *)fields
{
    NSArray *valuesArray = @[@(contactID), fields];
    return [self callServiceMethod:@"ContactService.load" withParameters:valuesArray];
}

// ContactService.merge

- (id)contactServiceMerge:(NSUInteger)contactID duplicateContactID:(NSUInteger)duplicateContactID
{
    NSArray *valuesArray = @[@(contactID), @(duplicateContactID)];
    return [self callServiceMethod:@"ContactService.merge" withParameters:valuesArray];
}

// ContactService.getNextCampaignStep

- (id)contactServiceGetNextCampaignStep:(NSUInteger)contactID followUpSequenceID:(NSUInteger)followUpSequenceID
{
    NSArray *valuesArray = @[@(contactID), @(followUpSequenceID)];
    return [self callServiceMethod:@"ContactService.getNextCampaignStep" withParameters:valuesArray];
}

// ContactService.pauseCampaign

- (id)contactServicePauseCampaign:(NSUInteger)contactID followUpSequenceID:(NSUInteger)followUpSequenceID
{
    NSArray *valuesArray = @[@(contactID), @(followUpSequenceID)];
    return [self callServiceMethod:@"ContactService.pauseCampaign" withParameters:valuesArray];
}

// ContactService.removeFromCampaign

- (id)contactServiceRemoveFromCampaign:(NSUInteger)contactID followUpSequenceID:(NSUInteger)followUpSequenceID
{
    NSArray *valuesArray = @[@(contactID), @(followUpSequenceID)];
    return [self callServiceMethod:@"ContactService.removeFromCampaign" withParameters:valuesArray];
}

// ContactService.runActionSequence

- (id)contactServiceRunActionSequence:(NSUInteger)contactID actionSetID:(NSUInteger)actionSetID
{
    NSArray *valuesArray = @[@(contactID), @(actionSetID)];
    return [self callServiceMethod:@"ContactService.runActionSequence" withParameters:valuesArray];
}

// ContactService.resumeCampaignForContact

- (id)contactServiceResumeCampaignForContact:(NSUInteger)contactID followUpSequenceID:(NSUInteger)followUpSequenceID
{
    NSArray *valuesArray = @[@(contactID), @(followUpSequenceID)];
    return [self callServiceMethod:@"ContactService.resumeCampaignForContact" withParameters:valuesArray];
}

// ContactService.rescheduleCampaignStep

- (id)contactServiceRescheduleCampaignStep:(NSArray *)contactIDs sequenceStepID:(NSUInteger)sequenceStepID
{
    NSArray *valuesArray = @[contactIDs, @(sequenceStepID)];
    return [self callServiceMethod:@"ContactService.rescheduleCampaignStep" withParameters:valuesArray];
}

// ContactService.addWithDupCheck

- (id)contactServiceAddWithDupCheck:(NSArray *)values dupCheckType:(NSString *)dupCheckType
{
    NSArray *valuesArray = @[values, dupCheckType];
    return [self callServiceMethod:@"ContactService.addWithDupCheck" withParameters:valuesArray];
}

// ContactService.update

- (id)contactServiceUpdate:(NSUInteger)contactID values:(NSArray *)values
{
    NSArray *valuesArray = @[@(contactID), values];
    return [self callServiceMethod:@"ContactService.update" withParameters:valuesArray];
}

#pragma mark - CreditCardSubmissionService

// CreditCardSubmissionService.requestSubmissionToken

- (id)creditCardSubmissionServiceRequestSubmissionToken:(NSUInteger)contactID
                                             successUrl:(NSString *)successUrl
                                             failureUrl:(NSString *)failureUrl
{
    NSArray *valuesArray = @[@(contactID), successUrl, failureUrl];
    return [self callServiceMethod:@"CreditCardSubmissionService.requestSubmissionToken" withParameters:valuesArray];
}

// CreditCardSubmissionService.requestCreditCardId

- (id)creditCardSubmissionServiceRequestCreditCardID:(NSString *)token
{
    NSArray *valuesArray = @[token];
    return [self callServiceMethod:@"CreditCardSubmissionService.requestCreditCardId" withParameters:valuesArray];
    
}


#pragma mark - DataService

// DataService.add

- (id)dataServiceAdd:(NSString *)table withValues:(NSArray *)values
{
    NSArray *valuesArray = @[table, values];
    return [self callServiceMethod:@"DataService.add" withParameters:valuesArray];
}

// DataService.addCustomField

- (id)dataServiceAddCustomField:(NSString *)customFieldType
                    displayName:(NSString *)displayName
                       dataType:(NSUInteger)dataType
                       headerID:(NSUInteger)headerID
{
    NSArray *valuesArray = @[customFieldType, displayName, @(dataType), @(headerID)];
    return [self callServiceMethod:@"DataService.addCustomField" withParameters:valuesArray];
}

// DataService.authenticateUser

- (id)dataServiceAuthenticateUser:(NSString *)username password:(NSString *)password
{
    // TODO:Check if [password md5] needs to changed to lowercase before submitting
    NSArray *valuesArray = @[username, [password md5]];
    return [self callServiceMethod:@"DataService.authenticateUser" withParameters:valuesArray];
}

// DataService.delete

- (id)dataServiceDelete:(NSString *)table recordID:(NSUInteger)recordID
{
    NSArray *valuesArray = @[table, @(recordID)];
    return [self callServiceMethod:@"DataService.delete" withParameters:valuesArray];
}

// DataService.echo

- (id)dataServiceEcho:(NSString *)text
{
    NSArray *valuesArray = @[text];
    return [self callServiceMethod:@"DataService.echo" withParameters:valuesArray useKey:NO];
}

// DataService.findByField

- (id)dataServiceFindByField:(NSString *)table
                       limit:(NSUInteger)limit
                        page:(NSUInteger)page
                       field:(NSString *)field
                       value:(NSString *)value
                      fields:(NSArray *)fields
{
    NSArray *valuesArray = @[table, @(limit), @(page), field, value, fields];
    return [self callServiceMethod:@"DataService.findByField" withParameters:valuesArray];
}

// DataService.getAppointmentICal

- (id)dataServiceGetAppointmentICal:(NSUInteger)appointmentId
{
    NSArray *valuesArray = @[@(appointmentId)];
    return [self callServiceMethod:@"DataService.getAppointmentICal" withParameters:valuesArray];
}

// DataService.getAppSetting

- (id)dataServiceGetAppSetting:(NSString *)module setting:(NSString *)setting
{
    NSArray *valuesArray = @[module, setting];
    return [self callServiceMethod:@"DataService.getAppSetting" withParameters:valuesArray];
}

// DataService.getTemporaryKey

- (id)dataServiceGetTemporaryKey:(NSString *)vendorKey
                        username:(NSString *)username
                        password:(NSString *)password
{
    NSArray *valuesArray = @[vendorKey, username, [password md5]];
    return [self callServiceMethod:@"DataService.getTemporaryKey" withParameters:valuesArray useKey:NO];
}

// DataService.load

- (id)dataServiceLoad:(NSString *)table
             recordID:(NSUInteger)recordID
               fields:(NSArray *)fields
{
    NSArray *valuesArray = @[table, @(recordID) ,fields];
    return [self callServiceMethod:@"DataService.load" withParameters:valuesArray];
}

// DataService.update

- (id)dataServiceUpdate:(NSString *)table recordID:(NSUInteger)recordID values:(NSArray *)values
{
    NSArray *valuesArray = @[table, @(recordID), values];
    return [self callServiceMethod:@"DataService.update" withParameters:valuesArray];
}

// DataService.updateCustomField

- (id)dataServiceUpdateCustomField:(NSUInteger)fieldID values:(NSArray *)values
{
    NSArray *valuesArray = @[@(fieldID), values];
    return [self callServiceMethod:@"DataService.updateCustomField" withParameters:valuesArray];
}

// DataService.query

- (id)dataServiceQuery:(NSString *)table
                 limit:(NSUInteger)limit
                  page:(NSUInteger)page
                 query:(NSArray *)query
                fields:(NSArray *)fields
          orderByField:(NSString *)orderByField
             ascending:(BOOL)ascending
{
    NSArray *valuesArray = @[table, @(limit), @(page), query, fields, orderByField, [NSNumber numberWithBool:ascending]];
    return [self callServiceMethod:@"DataService.query" withParameters:valuesArray];
}


#pragma mark - DiscountService

// DiscountService.addCategoryAssignmentToCategoryDiscount

- (id)discountServiceAddCategoryAssignmentToCategoryDiscount:(NSUInteger)categoryDiscountID
                                           productCategoryID:(NSUInteger)productCategoryID;
{
    NSArray *valuesArray = @[@(productCategoryID), @(productCategoryID)];
    return [self callServiceMethod:@"DiscountService.addCategoryAssignmentToCategoryDiscount" withParameters:valuesArray];
}

// DiscountService.addCategoryDiscount

- (id)discountServiceAddCategoryDiscount:(NSString *)name
                             description:(NSString *)description
               applyDiscountToCommission:(BOOL)applyDiscountToCommission
                                  amount:(NSDecimalNumber *)amount
{
    NSArray *valuesArray = @[name, description, [NSNumber numberWithBool:applyDiscountToCommission], amount];
    return [self callServiceMethod:@"DiscountService.addCategoryDiscount" withParameters:valuesArray];
}

// DiscountService.addFreeTrial

- (id)discountServiceAddFreeTrial:(NSString *)name
                      description:(NSString *)description
                    freetrialDays:(NSUInteger)freetrialDays
                        hidePrice:(BOOL)hidePrice
               subscriptionPlanID:(NSUInteger)subscriptionPlanID
{
    NSArray *valuesArray = @[name, description, @(freetrialDays), [NSNumber numberWithBool:hidePrice], @(subscriptionPlanID)];
    return [self callServiceMethod:@"DiscountService.addFreeTrial" withParameters:valuesArray];
}

// DiscountService.addOrderTotalDiscount

- (id)discountServiceAddOrderTotalDiscount:(NSString *)name
                               description:(NSString *)description
                 applyDiscountToCommission:(BOOL)applyDiscountToCommission
                           percentOrAmount:(NSUInteger)percentOrAmount
                                    amount:(NSDecimalNumber *)amount
                                   payType:(NSString *)paytype
{
    NSArray *valuesArray = @[name, description, [NSNumber numberWithBool:applyDiscountToCommission], @(percentOrAmount), amount, paytype];
    return [self callServiceMethod:@"DiscountService.addOrderTotalDiscount" withParameters:valuesArray];
}

// DiscountService.addProductTotalDiscount

- (id)discountServiceAddProductTotalDiscount:(NSString *)name
                                 description:(NSString *)description
                   applyDiscountToCommission:(BOOL)applyDiscountToCommission
                                   productID:(NSUInteger)productID
                             percentOrAmount:(NSUInteger)percentOrAmount
                                      amount:(NSDecimalNumber *)amount
{
    NSArray *valuesArray = @[name, description, [NSNumber numberWithBool:applyDiscountToCommission], @(productID), @(percentOrAmount), amount];
    return [self callServiceMethod:@"DiscountService.addProductTotalDiscount" withParameters:valuesArray];
}

// DiscountService.addShippingTotalDiscount

- (id)discountServiceAddShippingTotalDiscount:(NSString *)name
                                  description:(NSString *)description
                    applyDiscountToCommission:(BOOL)applyDiscountToCommission
                              percentOrAmount:(NSUInteger)percentOrAmount
                                       amount:(NSDecimalNumber *)amount
{
    NSArray *valuesArray = @[name, description, [NSNumber numberWithBool:applyDiscountToCommission], @(percentOrAmount), amount];
    return [self callServiceMethod:@"DiscountService.addShippingTotalDiscount" withParameters:valuesArray];
}

// DiscountService.getCategoryAssignmentsForCategoryDiscount

- (id)discountServiceGetCategoryAssignmentsForCategoryDiscount:(NSUInteger)categoryDiscountID
{
    NSArray *valuesArray = @[@(categoryDiscountID)];
    return [self callServiceMethod:@"DiscountService.getCategoryAssignmentsForCategoryDiscount" withParameters:valuesArray];
}

// DiscountService.getCategoryDiscount

- (id)discountServiceGetCategoryDiscount:(NSUInteger)categoryDiscountID
{
    NSArray *valuesArray = @[@(categoryDiscountID)];
    return [self callServiceMethod:@"DiscountService.getCategoryDiscount" withParameters:valuesArray];
}

// DiscountService.getFreeTrial

- (id)discountServiceGetFreeTrial:(NSUInteger)freeTrialID
{
    NSArray *valuesArray = @[@(freeTrialID)];
    return [self callServiceMethod:@"DiscountService.getFreeTrial" withParameters:valuesArray];
}

// DiscountService.getOrderTotalDiscount

- (id)discountServiceGetOrderTotalDiscount:(NSUInteger)orderID
{
    NSArray *valuesArray = @[@(orderID)];
    return [self callServiceMethod:@"DiscountService.getOrderTotalDiscount" withParameters:valuesArray];
}

// DiscountService.getProductTotalDiscount

- (id)discountServiceGetProductTotalDiscount:(NSUInteger)productID
{
    NSArray *valuesArray = @[@(productID)];
    return [self callServiceMethod:@"DiscountService.getProductTotalDiscount" withParameters:valuesArray];
}

// DiscountService.getShippingTotalDiscount

- (id)discountServiceGetShippingTotalDiscount:(NSUInteger)shippingTotalDiscountID
{
    NSArray *valuesArray = @[@(shippingTotalDiscountID)];
    return [self callServiceMethod:@"DiscountService.getShippingTotalDiscount" withParameters:valuesArray];
}


#pragma mark - APIEmailService

// APIEmailService.addEmailTemplate

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
                         mergeContext:(NSString *)mergeContext
{
    NSArray *valuesArray = @[title, category, fromAddress, toAddress, ccAddresses, bccAddresses, subject, textBody, htmlBody, contentType, mergeContext];
    return [self callServiceMethod:@"APIEmailService.addEmailTemplate" withParameters:valuesArray];
}

// APIEmailService.attachEmail

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
                   emailSentType:(NSUInteger)emailSentType
{
    NSArray *valuesArray = @[@(contactID), fromName, fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody, header, receivedDate, sentDate, @(emailSentType)];
    return [self callServiceMethod:@"APIEmailService.addEmailTemplate" withParameters:valuesArray];
}

// ApiEmailService.getAvailableMergeFields

- (id)apiEmailServiceGetAvailableMergeFields:(NSString *)mergeContext
{
    NSArray *valuesArray = @[mergeContext];
    return [self callServiceMethod:@"ApiEmailService.getAvailableMergeFields" withParameters:valuesArray];
}

// APIEmailService.getEmailTemplate

- (id)apiEmailServiceGetEmailTemplate:(NSUInteger)templateID
{
    NSArray *valuesArray = @[@(templateID)];
    return [self callServiceMethod:@"APIEmailService.getEmailTemplate" withParameters:valuesArray];
}

// APIEmailService.getOptStatus

- (id)apiEmailServiceGetOptStatus:(NSString *)email
{
    NSArray *valuesArray = @[email];
    return [self callServiceMethod:@"APIEmailService.getOptStatus" withParameters:valuesArray];
}

// APIEmailService.optIn

- (id)apiEmailServiceOptIn:(NSString *)email
               optInReason:(NSString *)optInReason
{
    NSArray *valuesArray = @[email, optInReason];
    return [self callServiceMethod:@"APIEmailService.optIn" withParameters:valuesArray];
    
}

// APIEmailService.optOut

- (id)apiEmailServiceOptOut:(NSString *)email
               optOutReason:(NSString *)optOutReason
{
    NSArray *valuesArray = @[email, optOutReason];
    return [self callServiceMethod:@"APIEmailService.optOut" withParameters:valuesArray];
    
}

// APIEmailService.sendEmail

- (id)apiEmailServiceSendEmail:(NSArray *)contactList
                   fromAddress:(NSString *)fromAddress
                     toAddress:(NSString *)toAddress
                   ccAddresses:(NSString *)ccAddresses
                  bccAddresses:(NSString *)bccAddresses
                   contentType:(NSString *)contentType
                       subject:(NSString *)subject
                      htmlBody:(NSString *)htmlBody
                       txtBody:(NSString *)textBody
                    templateID:(NSUInteger)templateID
{
    NSArray *valuesArray = @[contactList, fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody, @(templateID)];
    return [self callServiceMethod:@"APIEmailService.sendEmail" withParameters:valuesArray];
}

// APIEmailService.sendTemplate

- (id)apiEmailServiceSendTemplate:(NSArray *)contactList
                       templateID:(NSUInteger)templateID
{
    NSArray *valuesArray = @[contactList, @(templateID)];
    return [self callServiceMethod:@"APIEmailService.sendEmail" withParameters:valuesArray];
}

// APIEmailService.updateEmailTemplate

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
                            mergeContext:(NSString *)mergeContext
{
    NSArray *valuesArray = @[@(templateID), title, categories, fromAddress, toAddress, ccAddress, bccAddress, subject, textBody, htmlBody, contentType, mergeContext];
    return [self callServiceMethod:@"APIEmailService.sendEmail" withParameters:valuesArray];
}


#pragma mark - FileService

// FileService.getDownloadUrl

- (id)fileServiceGetDownloadUrl:(NSUInteger)fileID
{
    NSArray *valuesArray = @[@(fileID)];
    return [self callServiceMethod:@"FileService.getDownloadUrl" withParameters:valuesArray];
}

// FileService.getFile

- (id)fileServiceGetFile:(NSUInteger)fileID
{
    NSArray *valuesArray = @[@(fileID)];
    return [self callServiceMethod:@"FileService.getFile" withParameters:valuesArray];
}

// FileService.renameFile

- (id)fileServiceRenameFile:(NSUInteger)fileID
                   fileName:(NSString *)fileName
{
    NSArray *valuesArray = @[@(fileID), fileName];
    return [self callServiceMethod:@"FileService.renameFile" withParameters:valuesArray];
}

// FileService.replaceFile

- (id)fileServiceReplaceFile:(NSUInteger)fileID
           base64EncodedData:(NSString *)base64EncodedData
{
    NSArray *valuesArray = @[@(fileID), base64EncodedData];
    return [self callServiceMethod:@"FileService.replaceFile" withParameters:valuesArray];
}

// FileService.uploadFile

- (id)fileServiceUploadFile:(NSUInteger)contactID
                   filename:(NSString *)fileName
          base64EncodedData:(NSString *)base64EncodedData
{
    NSArray *valuesArray = @[@(contactID), fileName, base64EncodedData];
    return [self callServiceMethod:@"FileService.uploadFile" withParameters:valuesArray];
}


#pragma mark - FunnelService

// FunnelService.achieveGoal

- (id)funnelServiceAchieveGoal:(NSString *)integration
                      callName:(NSString *)callName
                     contactID:(NSUInteger)contactID
{
    NSArray *valuesArray = @[integration, callName, @(contactID)];
    return [self callServiceMethod:@"FunnelService.achieveGoal" withParameters:valuesArray];
}


#pragma mark - InvoiceService

// InvoiceService.addManualPayment

- (id)invoiceServiceAddManualPayment:(NSUInteger)invoiceID
                              amount:(NSDecimalNumber *)amount
                         paymentDate:(NSDate *)paymentDate
                         paymentType:(NSString *)paymentType
                  paymentDescription:(NSString *)paymentDescription
                   bypassCommissions:(BOOL)bypassCommissions
{
    NSArray *valuesArray = @[@(invoiceID), amount, paymentDate, paymentDescription, [NSNumber numberWithBool:bypassCommissions]];
    return [self callServiceMethod:@"InvoiceService.addManualPayment" withParameters:valuesArray];
}

// addOrderCommissionOverride

- (id)invoiceServiceAddOrderCommissionOverride:(NSUInteger)invoiceID
                                   affiliateID:(NSUInteger)affiliateID
                                     productID:(NSUInteger)productID
                                    percentage:(NSUInteger)percentage
                                        amount:(NSDecimalNumber *)amount
                                    payoutType:(NSUInteger)payoutType
                                   description:(NSString *)description
                                          date:(NSDate *)date
{
    NSArray *valuesArray = @[@(invoiceID), @(affiliateID), @(productID), @(percentage), amount, @(payoutType), description, date];
    return [self callServiceMethod:@"InvoiceService.addOrderCommissionOverride" withParameters:valuesArray];
}

// InvoiceService.addOrderItem

- (id)invoiceServiceAddOrderItem:(NSUInteger)invoiceID
                       productID:(NSUInteger)productID
                            type:(NSUInteger)type
                           price:(NSDecimalNumber *)price
                        quantity:(NSUInteger)quantity
                     description:(NSString *)description
                           notes:(NSString *)notes
{
    NSArray *valuesArray = @[@(invoiceID), @(productID), @(type), price, @(quantity), description, notes];
    return [self callServiceMethod:@"InvoiceService.addOrderItem" withParameters:valuesArray];
}

// InvoiceService.addPaymentPlan

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
               daysBetweenPayments:(NSUInteger)daysBetweenPayments
{
    NSArray *valuesArray = @[@(invoiceID), [NSNumber numberWithBool:autoCharge], @(creditCardID), @(merchantAccountID), @(daysBetweenPayments), @(maxRetry), initialPaymentAmount, initialPaymentDate, planStartDate, @(numberOfPayments), @(daysBetweenPayments)];
    return [self callServiceMethod:@"InvoiceService.addPaymentPlan" withParameters:valuesArray];
}

// InvoiceService.addRecurringOrder

- (id)invoiceServiceAddRecurringOrder:(NSUInteger)contactID
                       allowDuplicate:(BOOL)allowDuplicate
                           cProgramID:(NSUInteger)cProgramID
                             quantity:(NSUInteger)quantity
                                price:(NSDecimalNumber *)price
                              taxable:(BOOL)taxable
                    merchantAccountID:(NSUInteger)merchantAccountID
                         creditCardID:(NSUInteger)creditCardID
                          affiliateID:(NSUInteger)affiliateID
                       daysTillCharge:(NSUInteger)daysTillCharge
{
    NSArray *valuesArray = @[@(contactID), [NSNumber numberWithBool:allowDuplicate], @(cProgramID), @(quantity), price, [NSNumber numberWithBool:taxable], @(merchantAccountID), @(creditCardID), @(affiliateID), @(daysTillCharge)];
    return [self callServiceMethod:@"InvoiceService.addRecurringOrder" withParameters:valuesArray];
}

// InvoiceService.addRecurringOrder - Simple

- (id)invoiceServiceAddRecurringOrderSimple:(NSUInteger)contactID
                             allowDuplicate:(BOOL)allowDuplicate
                                 cProgramID:(NSUInteger)cProgramID
                          merchantAccountID:(NSUInteger)merchantAccountID
                               creditCardID:(NSUInteger)creditCardID
                                affiliateID:(NSUInteger)affiliateID
                             daysTillCharge:(NSUInteger)daysTillCharge
{
    NSArray *valuesArray = @[@(contactID), [NSNumber numberWithBool:allowDuplicate], @(cProgramID), @(merchantAccountID), @(creditCardID), @(affiliateID), @(daysTillCharge)];
    return [self callServiceMethod:@"InvoiceService.addRecurringOrder" withParameters:valuesArray];
    
}



// InvoiceService.addRecurringCommissionOverride

- (id)invoiceServiceAddRecurringCommissionOverride:(NSUInteger)recurringOrderID
                                       affiliateID:(NSUInteger)affiliateID
                                            amount:(NSDecimalNumber *)amount
                                        payoutType:(NSUInteger)payoutType
                                       description:(NSString *)description
{
    NSArray *valuesArray = @[@(recurringOrderID), @(affiliateID), amount, @(payoutType), description];
    return [self callServiceMethod:@"InvoiceService.addRecurringCommissionOverride" withParameters:valuesArray];
}

// InvoiceService.calculateAmountOwed

- (id)invoiceServiceCalculateAmountOwed:(NSUInteger)invoiceID
{
    NSArray *valuesArray = @[@(invoiceID)];
    return [self callServiceMethod:@"InvoiceService.calculateAmountOwed" withParameters:valuesArray];
}

// InvoiceService.chargeInvoice

- (id)invoiceServiceChargeInvoice:(NSUInteger)invoiceID
                            notes:(NSString *)notes
                     creditCardID:(NSUInteger)creditCardID
                merchantAccountID:(NSUInteger)merchantAccountID
                bypassCommissions:(BOOL)bypassCommissions
{
    NSArray *valuesArray = @[@(invoiceID), notes, @(creditCardID), @(merchantAccountID), [NSNumber numberWithBool:bypassCommissions]];
    return [self callServiceMethod:@"InvoiceService.chargeInvoice" withParameters:valuesArray];
}

// InvoiceService.createBlankOrder

- (id)invoiceServiceCreateBlankOrder:(NSUInteger)contactID
                         description:(NSString *)description
                           orderDate:(NSDate *)orderDate
                    leadAffilliateID:(NSUInteger)leadAffilliateID
                   salesAffilliateID:(NSUInteger)salesAffilliateID
{
    NSArray *valuesArray = @[@(contactID), description, orderDate, @(leadAffilliateID), @(salesAffilliateID)];
    return [self callServiceMethod:@"InvoiceService.createBlankOrder" withParameters:valuesArray];
}

// InvoiceService.createInvoiceForRecurring

- (id)invoiceServiceCreateInvoiceForRecurring:(NSUInteger)recurringOrderID
{
    NSArray *valuesArray = @[@(recurringOrderID)];
    return [self callServiceMethod:@"InvoiceService.createInvoiceForRecurring" withParameters:valuesArray];
}

// InvoiceService.deleteInvoice

- (id)invoiceServiceDeleteInvoice:(NSUInteger)invoiceID
{
    NSArray *valuesArray = @[@(invoiceID)];
    return [self callServiceMethod:@"InvoiceService.deleteInvoice" withParameters:valuesArray];
}

// InvoiceService.deleteSubscription

- (id)invoiceServiceDeleteSubscription:(NSUInteger)recurringOrderID
{
    NSArray *valuesArray = @[@(recurringOrderID)];
    return [self callServiceMethod:@"InvoiceService.deleteSubscription" withParameters:valuesArray];
}

// InvoiceService.getAllPaymentOptions

- (id)invoiceServiceGetAllPaymentOptions
{
    NSArray *valuesArray = @[];
    return [self callServiceMethod:@"InvoiceService.getAllPaymentOptions" withParameters:valuesArray];
}

// InvoiceService.getAllShippingOptions

- (id)invoiceServiceGetAllShippingOptions
{
    NSArray *valuesArray = @[];
    return [self callServiceMethod:@"InvoiceService.getAllShippingOptions" withParameters:valuesArray];
}

// InvoiceService.getInvoiceId

- (id)invoiceServiceGetInvoiceID:(NSUInteger)orderID
{
    NSArray *valuesArray = @[@(orderID)];
    return [self callServiceMethod:@"InvoiceService.getInvoiceId" withParameters:valuesArray];
}

//InvoiceService.getOrderId

- (id)invoiceServiceGetOrderID:(NSUInteger)invoiceID
{
    NSArray *valuesArray = @[@(invoiceID)];
    return [self callServiceMethod:@"InvoiceService.getOrderId" withParameters:valuesArray];
}

// InvoiceService.getPayments

- (id)invoiceServiceGetPayments:(NSUInteger)invoiceID
{
    NSArray *valuesArray = @[@(invoiceID)];
    return [self callServiceMethod:@"InvoiceService.getInvoiceId" withParameters:valuesArray];
}

// InvoiceService.getPluginStatus

- (id)invoiceServiceGetPluginStatus:(NSString *)className
{
    NSArray *valuesArray = @[className];
    return [self callServiceMethod:@"InvoiceService.getPluginStatus" withParameters:valuesArray];
}

// InvoiceService.locateExistingCard

- (id)invoiceServiceLocateExistingCard:(NSUInteger)contactID
                                 last4:(NSString *)last4
{
    NSArray *valuesArray = @[@(contactID), last4];
    return [self callServiceMethod:@"InvoiceService.locateExistingCard" withParameters:valuesArray];
}

// InvoiceService.recalculateTax

- (id)invoiceServiceRecalculateTax:(NSUInteger)invoiceID
{
    NSArray *valuesArray = @[@(invoiceID)];
    return [self callServiceMethod:@"InvoiceService.recalculateTax" withParameters:valuesArray];
}

// InvoiceService.setInvoiceSyncStatus

- (id)invoiceServiceSetInvoiceSyncStatus:(NSUInteger)invoiceID
                              syncStatus:(BOOL)syncStatus
{
    NSArray *valuesArray = @[@(invoiceID), [NSNumber numberWithBool:syncStatus]];
    return [self callServiceMethod:@"InvoiceService.setInvoiceSyncStatus" withParameters:valuesArray];
}

// InvoiceService.setPaymentSyncStatus

- (id)invoiceServiceSetPaymentSyncStatus:(NSUInteger)paymentID
                              syncStatus:(BOOL)syncStatus
{
    NSArray *valuesArray = @[@(paymentID), [NSNumber numberWithBool:syncStatus]];
    return [self callServiceMethod:@"InvoiceService.setPaymentSyncStatus" withParameters:valuesArray];
}

// InvoiceService.updateJobRecurringNextBillDate

- (id)invoiceServiceUpdateJobRecurringNextBillDate:(NSUInteger)recurringOrderID
                                      nextBillDate:(NSDate *)nextBillDate
{
    NSArray *valuesArray = @[@(recurringOrderID), nextBillDate];
    return [self callServiceMethod:@"InvoiceService.updateJobRecurringNextBillDate" withParameters:valuesArray];
}

// InvoiceService.validateCreditCard

- (id)invoiceServiceValidateExistingCreditCard:(NSUInteger)creditCardID
{
    NSArray *valuesArray = @[@(creditCardID)];
    return [self callServiceMethod:@"InvoiceService.validateCreditCard" withParameters:valuesArray];
}

- (id)invoiceServiceValidateNewCreditCard:(NSString *)cardType
                                contactID:(NSUInteger)contactID
                               cardNumber:(NSString *)cardNumber
                          expirationMonth:(NSString *)expirationMonth
                           expirationYear:(NSString *)expirationYear
                                     cvv2:(NSString *)cvv2
{
    NSArray *valuesArray = @[cardType, @(contactID), cardNumber, expirationMonth, expirationYear, cvv2];
    return [self callServiceMethod:@"InvoiceService.validateCreditCard" withParameters:valuesArray];
}


#pragma mark - OrderService

// OrderService.placeOrder

- (id)orderServicePlaceOrder:(NSUInteger)contactID
                creditCardID:(NSUInteger)creditCardID
               paymentPlanID:(NSUInteger)paymentPlanID
                  productIDs:(NSArray *)productIDs
         subscriptionPlanIDs:(NSArray *)subscriptionPlanIDs
             processSpecials:(BOOL)processSpecials
                  promoCodes:(NSArray *)promoCodes
             leadAffiliateID:(NSUInteger)leadAffiliateID
             saleAffiliateID:(NSUInteger)saleAffiliateID
{
    NSArray *valuesArray = @[@(contactID), @(creditCardID), @(paymentPlanID), productIDs, subscriptionPlanIDs, [NSNumber numberWithBool:processSpecials], promoCodes, @(leadAffiliateID), @(leadAffiliateID)];
    return [self callServiceMethod:@"OrderService.placeOrder" withParameters:valuesArray];
}


#pragma mark - ProductService

// ProductService.deactivateCreditCard

- (id)productServiceDeactivateCreditCard:(NSUInteger)creditCardID
{
    NSArray *valuesArray = @[@(creditCardID)];
    return [self callServiceMethod:@"ProductService.deactivateCreditCard" withParameters:valuesArray];
}

// ProductService.decreaseInventory

- (id)productServiceDecreaseInventory:(NSUInteger)productID
                             quantity:(NSUInteger)quantity
{
    NSArray *valuesArray = @[@(productID), @(quantity)];
    return [self callServiceMethod:@"ProductService.decreaseInventory" withParameters:valuesArray];
}

// ProductService.decrementInventory

- (id)productServiceDecrementInventory:(NSUInteger)productID
{
    NSArray *valuesArray = @[@(productID)];
    return [self callServiceMethod:@"ProductService.decrementInventory" withParameters:valuesArray];
}

// ProductService.getInventory

- (id)productServiceGetInventory:(NSUInteger)productID
{
    NSArray *valuesArray = @[@(productID)];
    return [self callServiceMethod:@"ProductService.getInventory" withParameters:valuesArray];
}

// ProductService.increaseInventory

- (id)productServiceIncreaseInventory:(NSUInteger)productID
                             quantity:(NSUInteger)quantity
{
    NSArray *valuesArray = @[@(productID), @(quantity)];
    return [self callServiceMethod:@"ProductService.increaseInventory" withParameters:valuesArray];
}

// ProductService.incrementInventory

- (id)productServiceIncrementInventory:(NSUInteger)productID
{
    NSArray *valuesArray = @[@(productID)];
    return [self callServiceMethod:@"ProductService.incrementInventory" withParameters:valuesArray];
}


#pragma mark - SearchService

// SearchService.getAllReportColumns

- (id)searchServiceGetAllReportColumns:(NSUInteger)savedSearchID
                                userID:(NSUInteger)userID
{
    NSArray *valuesArray = @[@(savedSearchID),@(userID)];
    return [self callServiceMethod:@"SearchService.getAllReportColumns" withParameters:valuesArray];
    
}

// SearchService.getAvailableQuickSearches

- (id)searchServiceGetAvailableQuickSearches:(NSUInteger)userID
{
    NSArray *valuesArray = @[@(userID)];
    return [self callServiceMethod:@"SearchService.getAvailableQuickSearches" withParameters:valuesArray];
    
}

// SearchService.getDefaultQuickSearch

- (id)searchServiceGetDefaultQuickSearch:(NSUInteger)userID
{
    NSArray *valuesArray = @[@(userID)];
    return [self callServiceMethod:@"SearchService.getDefaultQuickSearch" withParameters:valuesArray];
}

// SearchService.getSavedSearchResultsAllFields

- (id)searchServiceGetSavedSearchResultsAllFields:(NSUInteger)savedSearchID
                                           userID:(NSUInteger)userID
                                       pageNumber:(NSUInteger)pageNumber
{
    NSArray *valuesArray = @[@(savedSearchID),@(userID), @(pageNumber)];
    return [self callServiceMethod:@"SearchService.getSavedSearchResultsAllFields" withParameters:valuesArray];
}


// SearchService.getSavedSearchResults

- (id)searchServiceGetSavedSearchResults:(NSUInteger)savedSearchID
                                  userID:(NSUInteger)userID
                              pageNumber:(NSUInteger)pageNumber
                            returnFields:(NSArray *)returnFields
{
    NSArray *valuesArray = @[@(savedSearchID), @(userID), @(pageNumber), returnFields];
    return [self callServiceMethod:@"SearchService.getSavedSearchResults" withParameters:valuesArray];
}

// SearchService.quickSearch

- (id)searchServiceQuickSearch:(NSUInteger)quickSearchType
                        userID:(NSUInteger)userID
                    searchData:(NSString *)searchData
                          page:(NSUInteger)page
                         limit:(NSUInteger)limit
{
    NSArray *valuesArray = @[@(quickSearchType), @(userID), searchData, @(page), @(limit)];
    return [self callServiceMethod:@"SearchService.quickSearch" withParameters:valuesArray];
}


#pragma mark - ShippingService

// ShippingService.getAllShippingOptions

- (id)shippingServiceGetAllShippingOptions;
{
    NSArray *valuesArray = @[];
    return [self callServiceMethod:@"ShippingService.getAllShippingOptions" withParameters:valuesArray];
}

// ShippingService.getFlatRateShippingOption

- (id)shippingServiceGetFlatRateShippingOption:(NSUInteger)optionID
{
    NSArray *valuesArray = @[@(optionID)];
    return [self callServiceMethod:@"ShippingService.getFlatRateShippingOption" withParameters:valuesArray];
}

// ShippingService.getOrderTotalShippingOption

- (id)shippingServiceGetOrderTotalShippingOption:(NSUInteger)optionID;
{
    NSArray *valuesArray = @[@(optionID)];
    return [self callServiceMethod:@"ShippingService.getOrderTotalShippingOption" withParameters:valuesArray];
}

// ShippingService.getOrderTotalShippingRanges

- (id)shippingServiceGetOrderTotalShippingRanges:(NSUInteger)optionID
{
    NSArray *valuesArray = @[@(optionID)];
    return [self callServiceMethod:@"ShippingService.getOrderTotalShippingRanges" withParameters:valuesArray];
}

// ShippingService.getOrderQuantityShippingOption

- (id)shippingServiceGetOrderQuantityShippingOption:(NSUInteger)optionID
{
    NSArray *valuesArray = @[@(optionID)];
    return [self callServiceMethod:@"ShippingService.getOrderQuantityShippingOption" withParameters:valuesArray];
}

// ShippingService.getProductBasedShippingOption

- (id)shippingServiceGetProductBasedShippingOption:(NSUInteger)optionID
{
    NSArray *valuesArray = @[@(optionID)];
    return [self callServiceMethod:@"ShippingService.getProductBasedShippingOption" withParameters:valuesArray];
}

// ShippingService.getProductShippingPricesForProductShippingOption

- (id)shippingServiceGetProductShippingPricesForProductShippingOption:(NSUInteger)optionID
{
    NSArray *valuesArray = @[@(optionID)];
    return [self callServiceMethod:@"ShippingService.getProductShippingPricesForProductShippingOption" withParameters:valuesArray];
}

// ShippingService.getUpsShippingOption

- (id)shippingServiceGetUpsShippingOption:(NSUInteger)optionID
{
    NSArray *valuesArray = @[@(optionID)];
    return [self callServiceMethod:@"ShippingService.getUpsShippingOption" withParameters:valuesArray];
}

// ShippingService.getWeightBasedShippingOption

- (id)shippingServiceGetWeightBasedShippingOption:(NSUInteger)optionID
{
    NSArray *valuesArray = @[@(optionID)];
    return [self callServiceMethod:@"ShippingService.getWeightBasedShippingOption" withParameters:valuesArray];
}


#pragma mark - WebFormService

// WebFormService.getMap

- (id)webFormServiceGetMap
{
    NSArray *valuesArray = @[];
    return [self callServiceMethod:@"WebFormService.getMap" withParameters:valuesArray];
}

// WebFormService.getHTML

- (id)webFormServiceGetHTML:(NSUInteger)webFormID
{
    NSArray *valuesArray = @[@(webFormID)];
    return [self callServiceMethod:@"WebFormService.getHTML" withParameters:valuesArray];
}

#pragma mark WebTrackingService

// WebTrackingService.getWebTrackingScriptTag

- (id)webTrackingServiceGetWebTrackingScriptTag
{
    NSArray *valuesArray = @[];
    return [self callServiceMethod:@"WebTrackingService.getWebTrackingScriptTag" withParameters:valuesArray];
}

// WebTrackingService.getWebTrackingScriptUrl

- (id)webTrackingServiceGetWebTrackingScriptUrl
{
    NSArray *valuesArray = @[];
    return [self callServiceMethod:@"WebTrackingService.getWebTrackingScriptUrl" withParameters:valuesArray];
}

@end