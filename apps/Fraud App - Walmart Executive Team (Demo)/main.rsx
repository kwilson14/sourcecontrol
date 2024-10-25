<App>
  <Include src="./functions.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <TextInput
      id="textInput1"
      label=""
      labelPosition="top"
      placeholder="Search"
    />
    <DateRange
      id="dateRange1"
      dateFormat="MMM dd, yyyy"
      endPlaceholder="End date"
      iconBefore="bold/interface-calendar-remove"
      label="Date Filter"
      labelCaption="Filter the table results by date"
      labelPosition="top"
      startPlaceholder="Start date"
      textBetween="-"
      value={{ ordered: [{ start: "" }, { end: "" }] }}
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getFraud"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </DateRange>
    <Select
      id="select1"
      captionByIndex=""
      data="{{ getStoreLocation.data }}"
      emptyMessage="No options"
      iconByIndex=""
      label="Store Filter"
      labelCaption="Filter the table by store"
      labelPosition="top"
      labels="{{item.store_location}}"
      overlayMaxHeight={375}
      placeholder="Select a Store"
      showSelectionIndicator={true}
      value=""
      values=""
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getFraud"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getFraud.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      disableSave=""
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="893c3"
      rowHeight="medium"
      searchTerm="{{ textInput1.value }}"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="29f9d"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="customer_id"
        label="Customer ID"
        placeholder="Enter value"
        position="center"
        size={86.484375}
        summaryAggregationMode="none"
      />
      <Column
        id="893c3"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="id"
        label="ID"
        placeholder="Enter value"
        position="center"
        size={31.546875}
        summaryAggregationMode="none"
      />
      <Column
        id="bc0fe"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="transaction_id"
        label="Transaction ID"
        placeholder="Enter value"
        position="center"
        size={97.578125}
        summaryAggregationMode="none"
      />
      <Column
        id="0f6e0"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="product_id"
        label="Product ID"
        placeholder="Enter value"
        position="center"
        size={75.6875}
        summaryAggregationMode="none"
      />
      <Column
        id="0c83a"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="quantity"
        label="Quantity"
        placeholder="Enter value"
        position="center"
        size={64.15625}
        summaryAggregationMode="none"
      />
      <Column
        id="281fd"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="price_per_unit"
        label="Price per unit"
        placeholder="Enter value"
        position="center"
        size={91.34375}
        summaryAggregationMode="none"
      />
      <Column
        id="01860"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="total_price"
        label="Total price"
        placeholder="Enter value"
        position="center"
        size={75.578125}
        summaryAggregationMode="none"
      />
      <Column
        id="94972"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="transaction_date"
        label="Transaction date"
        placeholder="Enter value"
        position="center"
        size={146.75}
        summaryAggregationMode="none"
      />
      <Column
        id="775e9"
        alignment="left"
        editable={true}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="store_location"
        label="Store location"
        placeholder="Select option"
        position="center"
        size={98.859375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="f472b"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="transaction_type"
        label="Transaction type"
        placeholder="Select option"
        position="center"
        size={111.125}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="9a902"
        alignment="left"
        editable="true"
        editableOptions={{ alwaysShowCheckboxes: true }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="is_fraud"
        label="Is fraud"
        optionList={{
          manualData: [
            { ordered: [{ value: "Not Fraud" }, { label: "" }] },
            { ordered: [{ value: "Fraud" }, { label: "" }] },
          ],
          mode: "manual",
          mappedData: "{{ datePicker.data }}",
        }}
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      >
        <Event
          event="changeCell"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="updateFraud"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="save"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateFraud"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="changeCell"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateFraud"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
    <Statistic
      id="statistic1"
      currency="USD"
      label="Fraudulent Customer Count "
      labelCaption="Since March 5th"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryDecimalPlaces=""
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue <= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue="{{ secValueFraudCount.data.percent_difference / 100 }}"
      showSeparators={true}
      value="{{countFraud.data.fraudulent_customers}}"
    />
    <Statistic
      id="statistic2"
      currency="USD"
      formattingStyle="currency"
      label="Damage Amount"
      labelCaption="Since March 5th"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryDecimalPlaces="2"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue <= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue="{{ secValueDamage.data.percent_difference / 100 }}"
      showSeparators={true}
      value="{{fraudDamage.data.total_return_over_purchase }}"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="countFraud"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Statistic>
    <PlotlyChart
      id="chart1"
      chartType="line"
      dataseries={{
        ordered: [
          {
            0: {
              ordered: [
                { label: "damage" },
                { datasource: "{{getGraph.data['damage']}}" },
                { chartType: "line" },
                { aggregationType: "sum" },
                { color: "#1E3A8A" },
                { colors: { ordered: [] } },
                { visible: true },
                {
                  hovertemplate:
                    "<b>%{x}</b><br>%{fullData.name}: %{y}<extra></extra>",
                },
              ],
            },
          },
        ],
      }}
      datasourceDataType="object"
      datasourceInputMode="javascript"
      datasourceJS="{{getGraph.data}}"
      datasourcePluginId="getGraph"
      datasourcePluginType="plugin"
      events={[]}
      groupByDropdown={null}
      isDataTemplateDirty={true}
      layout={include("./lib/chart1.layout.json", "string")}
      legendAlignment="right"
      margin="4px 8px"
      shouldShowLegend={false}
      skipDatasourceUpdate={true}
      title="Fraud Damage by Transaction Date"
      xAxis="{{getGraph.data.transaction_date}}"
      xAxisDropdown="transaction_date"
      xAxisMode="javascript"
      xAxisTitle="Transaction Date"
      xAxisType="category"
      yAxisTitle="$ Damage"
    />
    <Button id="button1" text="Button" />
    <Button id="button3" text="Button" />
    <Button id="button4" text="Button" />
    <Button id="button2" text="Button" />
    <Button id="button5" text="Button" />
  </Frame>
</App>
