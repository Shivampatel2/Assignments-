Sub VBAHomework()

For Each ws In Worksheets

  Dim FinalRows As Long
  Dim SheetName As String
  Dim StockTicker As Long
  Dim TickerTotal As Double
  Dim FirstRow As Long, EndRow As Long
  Dim YearlyChange As Double
  Dim PercentChange As Double
  Dim LastYear As Double
  Dim CurrentYear As Double
  Dim i As Long
  
  FinalRows = ws.Cells(Rows.Count, 1).End(xlUp).Row
  SheetName = ws.Name

  ws.Range("I1").Value = "Ticker"
  ws.Range("J1").Value = "Yearly Change"
  ws.Range("K1").Value = "Percent Change"
  ws.Range("L1").Value = "Total Stock Volume"
  ws.Range("O1").Value = "Ticker"
  ws.Range("P1").Value = "Value"
  ws.Range("N2").Value = "Greatest % Increase"
  ws.Range("N3").Value = "Greatest % Decrease"
  ws.Range("N4").Value = "Greatest Total Volume"

  StockTicker = 2
  TickerTotal = 0 
  FirstRow = 2 

  For i = 2 To FinalRows

      If ws.Range("A" & (i + 1)).Value <> ws.Range("A" & i).Value Then
          EndRow = i
          TickerTotal = TickerTotal + Range("G" & i).Value
           
          ws.Range("I" & StockTicker).Value = ws.Range("A" & i).Value
          ws.Range("L" & StockTicker).Value = TickerTotal
          ws.Range("J" & StockTicker).Value = ws.Range("F" & EndRow).Value - ws.Range("C" & FirstRow).Value
          YearlyChange = ws.Range("J" & StockTicker).Value
          LastYear = ws.Range("C" & FirstRow).Value
          CurrentYear = ws.Range("F" & EndRow).Value

              If LastYear = 0 And CurrentYear = 0 Then
              ws.Range("K" & StockTicker).Value = 0
              ElseIf LastYear = 0 Then
              ws.Range("K" & StockTicker).Value = 1
              ElseIf CurrentYear = 0 Then
              ws.Range("K" & StockTicker).Value = -1
              Else
              ws.Range("K" & StockTicker).Value = YearlyChange / LastYear
              End If

              PercentChange = ws.Range("K" & StockTicker).Value
              If YearlyChange > 0 Then
              ws.Range("J" & StockTicker).Interior.ColorIndex = 4
              ElseIf ws.Range("J" & StockTicker).Value < 0 Then
              ws.Range("J" & StockTicker).Interior.ColorIndex = 3
              Else
              ws.Range("J" & StockTicker).Interior.ColorIndex = 0
              End If
          FirstRow = EndRow + 1
          StockTicker = StockTicker + 1
          TickerTotal = 0
          Else
          TickerTotal = TickerTotal + ws.Range("G" & i).Value

      End If


  Next i


  Dim TickerVolume As String
  Dim TotalVolume As Double
  Dim MinTotal As Double
  Dim MaxTotal As Double
  Dim MinTicker As String
  Dim MaxTicker As String
  Dim FinTotalRow As Long
  Dim j As Long

  MinTotal = Range("K2").Value
  MaxTotal = Range("K2").Value
  TotalVolume = Range("L2").Value
  FinTotalRow = ws.Cells(Rows.Count, 9).End(xlUp).Row

   For j = 2 To FinTotalRow
      If ws.Range("K" & (j + 1)).Value < MinTotal Then
      MinTicker = ws.Range("I" & (j + 1)).Value
      MinTotal = ws.Range("K" & (j + 1)).Value
      End If
      If ws.Range("K" & (j + 1)).Value > MaxTotal Then
      MaxTicker = ws.Range("I" & (j + 1)).Value
      MaxTotal = ws.Range("K" & (j + 1)).Value
      End If
      If ws.Range("L" & (j + 1)).Value > TotalVolume Then
      TickerVolume = ws.Range("I" & (j + 1)).Value
      TickerTotal = ws.Range("L" & (j + 1)).Value
      End If
   Next j

  ws.Range("O2").Value = MaxTicker
  ws.Range("O3").Value = MinTicker
  ws.Range("O4").Value = TickerVolume
  ws.Range("P2").Value = MaxTotal
  ws.Range("P3").Value = MinTotal
  ws.Range("P4").Value = TotalVolume

Next ws

End Sub