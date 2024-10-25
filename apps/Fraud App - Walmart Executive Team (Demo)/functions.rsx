<GlobalFunctions>
  <SqlQueryUnified
    id="getFraud"
    isMultiplayerEdited={false}
    query={include("./lib/getFraud.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="01fc773a-678f-43d9-9619-c13f6257f12e"
    transformer=""
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="countFraud"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/countFraud.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="01fc773a-678f-43d9-9619-c13f6257f12e"
    resourceTypeOverride=""
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="fraudDamage"
    enableTransformer={true}
    isMultiplayerEdited={false}
    query={include("./lib/fraudDamage.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="01fc773a-678f-43d9-9619-c13f6257f12e"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getGraph"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/getGraph.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="01fc773a-678f-43d9-9619-c13f6257f12e"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="secValueFraudCount"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/secValueFraudCount.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="01fc773a-678f-43d9-9619-c13f6257f12e"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="secValueDamage"
    notificationDuration={4.5}
    query={include("./lib/secValueDamage.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="01fc773a-678f-43d9-9619-c13f6257f12e"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="updateFraud"
    actionType="UPDATE_BY"
    changeset={
      '[{"key":"is_fraud","value":"{{ table1.changesetArray[\'0\'].is_fraud}}"}]'
    }
    changesetObject="{{ table1.selectedRow }}"
    doNotThrowOnNoOp={true}
    editorMode="gui"
    enableBulkUpdates={true}
    enableTransformer={true}
    filterBy={
      '[{"key":"id","value":"{{ table1.changesetArray[\'0\'].id }}","operation":"="}]'
    }
    notificationDuration={4.5}
    resourceDisplayName="retool_db"
    resourceName="01fc773a-678f-43d9-9619-c13f6257f12e"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    tableName="walmart_nj_fraud_updated"
    updateSetValueDynamically={true}
  >
    <Event
      event="success"
      method="trigger"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { onSuccess: null },
                { onFailure: null },
                { additionalScope: null },
              ],
            },
          },
        ],
      }}
      pluginId="getFraud"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <SqlQueryUnified
    id="getStoreLocation"
    notificationDuration={4.5}
    query={include("./lib/getStoreLocation.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="01fc773a-678f-43d9-9619-c13f6257f12e"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <Function id="transformer1" />
</GlobalFunctions>
