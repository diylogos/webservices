module SalesforceArticle
  class TopMarketsData < BaseData
    include ::Importable
    include ::VersionableResource

    def query_string
      @query_string ||= <<-SOQL
        SELECT Id,
               Atom__c,
               Business_Unit__c,
               Chapter__c,
               FirstPublishedDate,
               LastPublishedDate,
               Public_URL__c,
               References__c,
               Section__c,
               Summary,
               Title,
               UrlName,
               (SELECT Id, DataCategoryName, DataCategoryGroupName FROM DataCategorySelections)
        FROM Top_Markets__kav
        WHERE PublishStatus = 'Online'
        AND Language = 'en_US'
        AND IsLatestVersion=true
        AND IsVisibleInPkb=true
      SOQL
    end
  end
end
