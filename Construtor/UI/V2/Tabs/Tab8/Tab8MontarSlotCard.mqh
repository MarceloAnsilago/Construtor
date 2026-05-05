#ifndef __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__
#define __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__

#include "Tab8Shared.mqh"

class CTab8MontarSlotCard : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate *m_host;
   CEF_CTabs      *m_tabs;
   bool            m_created;
   bool            m_is_active;
   int             m_window_index;
   int             m_tab_index;
   int             m_slot_index;
   int             m_last_selected_index;

   CEF_CFrame      m_card;
   CEF_CTextLabel  m_title;
   CEF_CTextLabel  m_combo_label;
   CEF_CComboBox   m_combo;
   CEF_CFrame      m_body;

   CEF_CTextLabel  m_view_title;
   CEF_CTextLabel  m_view_note;

   CEF_CTextLabel  m_rsi_period_label;
   CEF_CTextEdit   m_rsi_period_spin;
   CEF_CTextLabel  m_rsi_price_label;
   CEF_CComboBox   m_rsi_price_combo;

   CEF_CTextLabel  m_reg_period_label;
   CEF_CTextEdit   m_reg_period_spin;
   CEF_CTextLabel  m_reg_ma_type_label;
   CEF_CComboBox   m_reg_ma_type_combo;
   CEF_CTextLabel  m_reg_price_label;
   CEF_CComboBox   m_reg_price_combo;

   CEF_CTextLabel  m_keltner_period_label;
   CEF_CTextEdit   m_keltner_period_spin;
   CEF_CTextLabel  m_keltner_deviation_label;
   CEF_CTextEdit   m_keltner_deviation_spin;
   CEF_CTextLabel  m_keltner_ma_type_label;
   CEF_CComboBox   m_keltner_ma_type_combo;

   CEF_CTextLabel  m_donchian_period_label;
   CEF_CTextEdit   m_donchian_period_spin;

   CEF_CTextLabel  m_afast_period_label;
   CEF_CTextEdit   m_afast_period_spin;
   CEF_CTextLabel  m_afast_shift_label;
   CEF_CTextEdit   m_afast_shift_spin;
   CEF_CTextLabel  m_afast_ma_type_label;
   CEF_CComboBox   m_afast_ma_type_combo;
   CEF_CTextLabel  m_afast_price_label;
   CEF_CComboBox   m_afast_price_combo;

   CEF_CTextLabel  m_desvio_period_label;
   CEF_CTextEdit   m_desvio_period_spin;
   CEF_CTextLabel  m_desvio_ma_type_label;
   CEF_CComboBox   m_desvio_ma_type_combo;
   CEF_CTextLabel  m_desvio_price_label;
   CEF_CComboBox   m_desvio_price_combo;

   CEF_CTextLabel  m_atr_channel_period_label;
   CEF_CTextEdit   m_atr_channel_period_spin;
   CEF_CTextLabel  m_atr_channel_deviation_label;
   CEF_CTextEdit   m_atr_channel_deviation_spin;

   CEF_CTextLabel  m_ma_period_label;
   CEF_CTextEdit   m_ma_period_spin;
   CEF_CTextLabel  m_ma_shift_label;
   CEF_CTextEdit   m_ma_shift_spin;
   CEF_CTextLabel  m_ma_type_label;
   CEF_CComboBox   m_ma_type_combo;
   CEF_CTextLabel  m_ma_price_label;
   CEF_CComboBox   m_ma_price_combo;

   CEF_CTextLabel  m_bbands_period_label;
   CEF_CTextEdit   m_bbands_period_spin;
   CEF_CTextLabel  m_bbands_deviation_label;
   CEF_CTextEdit   m_bbands_deviation_spin;
   CEF_CTextLabel  m_bbands_shift_label;
   CEF_CTextEdit   m_bbands_shift_spin;
   CEF_CTextLabel  m_bbands_price_label;
   CEF_CComboBox   m_bbands_price_combo;

   CEF_CTextLabel  m_env_period_label;
   CEF_CTextEdit   m_env_period_spin;
   CEF_CTextLabel  m_env_shift_label;
   CEF_CTextEdit   m_env_shift_spin;
   CEF_CTextLabel  m_env_ma_type_label;
   CEF_CComboBox   m_env_ma_type_combo;
   CEF_CTextLabel  m_env_deviation_label;
   CEF_CTextEdit   m_env_deviation_spin;

   CEF_CTextLabel  m_stoch_k_label;
   CEF_CTextEdit   m_stoch_k_spin;
   CEF_CTextLabel  m_stoch_d_label;
   CEF_CTextEdit   m_stoch_d_spin;
   CEF_CTextLabel  m_stoch_slow_label;
   CEF_CTextEdit   m_stoch_slow_spin;
   CEF_CTextLabel  m_stoch_ma_type_label;
   CEF_CComboBox   m_stoch_ma_type_combo;
   CEF_CTextLabel  m_stoch_price_type_label;
   CEF_CComboBox   m_stoch_price_type_combo;

   CEF_CTextLabel  m_macd_fast_label;
   CEF_CTextEdit   m_macd_fast_spin;
   CEF_CTextLabel  m_macd_slow_label;
   CEF_CTextEdit   m_macd_slow_spin;
   CEF_CTextLabel  m_macd_signal_label;
   CEF_CTextEdit   m_macd_signal_spin;
   CEF_CTextLabel  m_macd_price_label;
   CEF_CComboBox   m_macd_price_combo;

   CEF_CTextLabel  m_ad_volume_label;
   CEF_CComboBox   m_ad_volume_combo;

   CEF_CTextLabel  m_mfi_period_label;
   CEF_CTextEdit   m_mfi_period_spin;
   CEF_CTextLabel  m_mfi_volume_label;
   CEF_CComboBox   m_mfi_volume_combo;

   CEF_CTextLabel  m_vidya_cmo_period_label;
   CEF_CTextEdit   m_vidya_cmo_period_spin;
   CEF_CTextLabel  m_vidya_ema_period_label;
   CEF_CTextEdit   m_vidya_ema_period_spin;
   CEF_CTextLabel  m_vidya_shift_label;
   CEF_CTextEdit   m_vidya_shift_spin;
   CEF_CTextLabel  m_vidya_price_label;
   CEF_CComboBox   m_vidya_price_combo;

   CEF_CTextLabel  m_tema_period_label;
   CEF_CTextEdit   m_tema_period_spin;
   CEF_CTextLabel  m_tema_shift_label;
   CEF_CTextEdit   m_tema_shift_spin;
   CEF_CTextLabel  m_tema_price_label;
   CEF_CComboBox   m_tema_price_combo;

   CEF_CTextLabel  m_obv_volume_label;
   CEF_CComboBox   m_obv_volume_combo;

   CEF_CTextLabel  m_stddev_period_label;
   CEF_CTextEdit   m_stddev_period_spin;
   CEF_CTextLabel  m_stddev_ma_type_label;
   CEF_CComboBox   m_stddev_ma_type_combo;
   CEF_CTextLabel  m_stddev_price_label;
   CEF_CComboBox   m_stddev_price_combo;

   CEF_CTextLabel  m_volume_type_label;
   CEF_CComboBox   m_volume_type_combo;

   CEF_CTextLabel  m_atr_period_label;
   CEF_CTextEdit   m_atr_period_spin;

   CEF_CTextLabel  m_sar_step_label;
   CEF_CTextEdit   m_sar_step_spin;
   CEF_CTextLabel  m_sar_max_label;
   CEF_CTextEdit   m_sar_max_spin;

   void HideFrame(CEF_CFrame &frame) { frame.Hide(); frame.Update(true); }
   void ShowFrame(CEF_CFrame &frame) { frame.Show(); frame.Update(true); }

   bool CreateBodyLabel(CEF_CTextLabel &label,const string text,CElement &owner,const int x,const int y,const int width,const int height,const int font_size=10,const color text_color=clrNONE)
     {
      if(m_tabs==NULL)
         return(false);
      if(!m_host.CreateTextLabel(label,text,owner,m_window_index,*m_tabs,m_tab_index,x,y,width,height))
         return(false);
      label.FontSize(font_size);
      label.LabelColor(text_color==clrNONE ? V2_COLOR_TEXT_SECONDARY : text_color);
      return(true);
     }

   bool CreateComboControl(CEF_CComboBox &combo,CElement &owner,const int x,const int y,const int width,const int list_height,string &items[],const int selected_index,const color border)
     {
      if(m_tabs==NULL)
         return(false);
      combo.MainPointer(owner);
      (*m_tabs).AddToElementsArray(m_tab_index,combo);
      combo.ItemsTotal(ArraySize(items));
      for(int i=0;i<ArraySize(items);i++)
         combo.SetValue(i,items[i]);
      V2StyleCombo(combo,border,width,list_height,width-2);
      if(!combo.CreateComboBox("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,combo);
      combo.SelectItem(V2ClampIndex(selected_index,0,ArraySize(items)-1));
      return(true);
     }

   bool CreateSpinControl(CEF_CTextEdit &spin,CElement &owner,const int x,const int y,const int width,const double max_value,const double min_value,const double step,const int digits,const string value,const color back,const color border)
     {
      if(m_tabs==NULL)
         return(false);
      spin.MainPointer(owner);
      (*m_tabs).AddToElementsArray(m_tab_index,spin);
      V2StyleSpin(spin,back,border,width,max_value,min_value,step,digits,value);
      if(!spin.CreateTextEdit("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,spin);
      return(true);
     }

   void BuildIndicatorItems(string &items[])
     {
      ArrayResize(items,23);
      items[0]="Nao usar";
      items[1]="Keltner";
      items[2]="Donchian";
      items[3]="Regressao";
      items[4]="Afastamento da media";
      items[5]="Desvio medio";
      items[6]="ATR com desvio";
      items[7]="Media movel";
      items[8]="Bandas de Bollinger";
      items[9]="Envelopes";
      items[10]="Estocastico";
      items[11]="RSI";
      items[12]="StdDev";
      items[13]="Volume";
      items[14]="ATR";
      items[15]="Parabolic SAR";
      items[16]="Fractal";
      items[17]="OBV";
      items[18]="MACD";
      items[19]="Acumulacao/Distribuicao (A/D)";
      items[20]="MFI (Money Flow Index)";
      items[21]="Vidya";
      items[22]="Tema";
     }

   void BuildPlaceholderText(const string &indicator_name,string &title_text,string &body_text)
     {
      if(indicator_name=="Nao usar")
        {
         title_text="Nao usar";
         body_text="Este slot nao participa da composicao do sinal enquanto estiver desativado.";
         return;
        }

      title_text=indicator_name;
      body_text="Os parametros de "+indicator_name+" serao portados aqui no proprio card deste slot.";
     }

   void HideLabel(CEF_CTextLabel &label) { label.Hide(); label.Update(true); }
   void ShowLabel(CEF_CTextLabel &label) { label.Show(); label.Update(true); }
   void HideCombo(CEF_CComboBox &combo) { combo.Hide(); combo.Update(true); }
   void ShowCombo(CEF_CComboBox &combo) { combo.Show(); combo.Update(true); }
   void HideSpin(CEF_CTextEdit &spin) { spin.Hide(); spin.Update(true); }
   void ShowSpin(CEF_CTextEdit &spin) { spin.Show(); spin.Update(true); }

   void HideAllContent(void)
     {
      HideLabel(m_view_title);
      HideLabel(m_view_note);

      HideLabel(m_rsi_period_label);
      HideSpin(m_rsi_period_spin);
      HideLabel(m_rsi_price_label);
      HideCombo(m_rsi_price_combo);

      HideLabel(m_reg_period_label);
      HideSpin(m_reg_period_spin);
      HideLabel(m_reg_ma_type_label);
      HideCombo(m_reg_ma_type_combo);
      HideLabel(m_reg_price_label);
      HideCombo(m_reg_price_combo);

      HideLabel(m_keltner_period_label);
      HideSpin(m_keltner_period_spin);
      HideLabel(m_keltner_deviation_label);
      HideSpin(m_keltner_deviation_spin);
      HideLabel(m_keltner_ma_type_label);
      HideCombo(m_keltner_ma_type_combo);

      HideLabel(m_donchian_period_label);
      HideSpin(m_donchian_period_spin);

      HideLabel(m_afast_period_label);
      HideSpin(m_afast_period_spin);
      HideLabel(m_afast_shift_label);
      HideSpin(m_afast_shift_spin);
      HideLabel(m_afast_ma_type_label);
      HideCombo(m_afast_ma_type_combo);
      HideLabel(m_afast_price_label);
      HideCombo(m_afast_price_combo);

      HideLabel(m_desvio_period_label);
      HideSpin(m_desvio_period_spin);
      HideLabel(m_desvio_ma_type_label);
      HideCombo(m_desvio_ma_type_combo);
      HideLabel(m_desvio_price_label);
      HideCombo(m_desvio_price_combo);

      HideLabel(m_atr_channel_period_label);
      HideSpin(m_atr_channel_period_spin);
      HideLabel(m_atr_channel_deviation_label);
      HideSpin(m_atr_channel_deviation_spin);

      HideLabel(m_ma_period_label);
      HideSpin(m_ma_period_spin);
      HideLabel(m_ma_shift_label);
      HideSpin(m_ma_shift_spin);
      HideLabel(m_ma_type_label);
      HideCombo(m_ma_type_combo);
      HideLabel(m_ma_price_label);
      HideCombo(m_ma_price_combo);

      HideLabel(m_bbands_period_label);
      HideSpin(m_bbands_period_spin);
      HideLabel(m_bbands_deviation_label);
      HideSpin(m_bbands_deviation_spin);
      HideLabel(m_bbands_shift_label);
      HideSpin(m_bbands_shift_spin);
      HideLabel(m_bbands_price_label);
      HideCombo(m_bbands_price_combo);

      HideLabel(m_env_period_label);
      HideSpin(m_env_period_spin);
      HideLabel(m_env_shift_label);
      HideSpin(m_env_shift_spin);
      HideLabel(m_env_ma_type_label);
      HideCombo(m_env_ma_type_combo);
      HideLabel(m_env_deviation_label);
      HideSpin(m_env_deviation_spin);

      HideLabel(m_stoch_k_label);
      HideSpin(m_stoch_k_spin);
      HideLabel(m_stoch_d_label);
      HideSpin(m_stoch_d_spin);
      HideLabel(m_stoch_slow_label);
      HideSpin(m_stoch_slow_spin);
      HideLabel(m_stoch_ma_type_label);
      HideCombo(m_stoch_ma_type_combo);
      HideLabel(m_stoch_price_type_label);
      HideCombo(m_stoch_price_type_combo);

      HideLabel(m_macd_fast_label);
      HideSpin(m_macd_fast_spin);
      HideLabel(m_macd_slow_label);
      HideSpin(m_macd_slow_spin);
      HideLabel(m_macd_signal_label);
      HideSpin(m_macd_signal_spin);
      HideLabel(m_macd_price_label);
      HideCombo(m_macd_price_combo);

      HideLabel(m_ad_volume_label);
      HideCombo(m_ad_volume_combo);

      HideLabel(m_mfi_period_label);
      HideSpin(m_mfi_period_spin);
      HideLabel(m_mfi_volume_label);
      HideCombo(m_mfi_volume_combo);

      HideLabel(m_vidya_cmo_period_label);
      HideSpin(m_vidya_cmo_period_spin);
      HideLabel(m_vidya_ema_period_label);
      HideSpin(m_vidya_ema_period_spin);
      HideLabel(m_vidya_shift_label);
      HideSpin(m_vidya_shift_spin);
      HideLabel(m_vidya_price_label);
      HideCombo(m_vidya_price_combo);

      HideLabel(m_tema_period_label);
      HideSpin(m_tema_period_spin);
      HideLabel(m_tema_shift_label);
      HideSpin(m_tema_shift_spin);
      HideLabel(m_tema_price_label);
      HideCombo(m_tema_price_combo);

      HideLabel(m_obv_volume_label);
      HideCombo(m_obv_volume_combo);

      HideLabel(m_stddev_period_label);
      HideSpin(m_stddev_period_spin);
      HideLabel(m_stddev_ma_type_label);
      HideCombo(m_stddev_ma_type_combo);
      HideLabel(m_stddev_price_label);
      HideCombo(m_stddev_price_combo);

      HideLabel(m_volume_type_label);
      HideCombo(m_volume_type_combo);

      HideLabel(m_atr_period_label);
      HideSpin(m_atr_period_spin);

      HideLabel(m_sar_step_label);
      HideSpin(m_sar_step_spin);
      HideLabel(m_sar_max_label);
      HideSpin(m_sar_max_spin);
    }

   void SetViewText(const string title,const string note)
     {
      m_view_title.LabelText(title);
      m_view_title.Update(true);
      m_view_note.LabelText(note);
      m_view_note.Update(true);
     }

   void ShowPlaceholderView(const string title,const string body)
     {
      HideAllContent();
      SetViewText(title,body);
      ShowLabel(m_view_title);
      ShowLabel(m_view_note);
     }

   void ShowMediaMovelView(void)
     {
      HideAllContent();
      SetViewText("Media movel","");
      ShowLabel(m_view_title);

      ShowLabel(m_ma_period_label);
      ShowSpin(m_ma_period_spin);
      ShowLabel(m_ma_shift_label);
      ShowSpin(m_ma_shift_spin);
      ShowLabel(m_ma_type_label);
      ShowCombo(m_ma_type_combo);
      ShowLabel(m_ma_price_label);
      ShowCombo(m_ma_price_combo);
     }

   void ShowRSIView(void)
     {
      HideAllContent();
      SetViewText("RSI","");
      ShowLabel(m_view_title);

      ShowLabel(m_rsi_period_label);
      ShowSpin(m_rsi_period_spin);
      ShowLabel(m_rsi_price_label);
      ShowCombo(m_rsi_price_combo);
     }

   void ShowFractalView(void)
     {
      ShowPlaceholderView("Fractal","Sem parametros.");
     }

   void ShowDonchianView(void)
     {
      HideAllContent();
      SetViewText("Donchian","");
      ShowLabel(m_view_title);
      ShowLabel(m_donchian_period_label);
      ShowSpin(m_donchian_period_spin);
     }

   void ShowAfastamentoView(void)
     {
      HideAllContent();
      SetViewText("Afastamento da media","");
      ShowLabel(m_view_title);
      ShowLabel(m_afast_period_label);
      ShowSpin(m_afast_period_spin);
      ShowLabel(m_afast_shift_label);
      ShowSpin(m_afast_shift_spin);
      ShowLabel(m_afast_ma_type_label);
      ShowCombo(m_afast_ma_type_combo);
      ShowLabel(m_afast_price_label);
      ShowCombo(m_afast_price_combo);
     }

   void ShowDesvioMedioView(void)
     {
      HideAllContent();
      SetViewText("Desvio medio","");
      ShowLabel(m_view_title);
      ShowLabel(m_desvio_period_label);
      ShowSpin(m_desvio_period_spin);
      ShowLabel(m_desvio_ma_type_label);
      ShowCombo(m_desvio_ma_type_combo);
      ShowLabel(m_desvio_price_label);
      ShowCombo(m_desvio_price_combo);
     }

   void ShowAtrChannelView(void)
     {
      HideAllContent();
      SetViewText("ATR com desvio","");
      ShowLabel(m_view_title);
      ShowLabel(m_atr_channel_period_label);
      ShowSpin(m_atr_channel_period_spin);
      ShowLabel(m_atr_channel_deviation_label);
      ShowSpin(m_atr_channel_deviation_spin);
     }

   void ShowRegressaoView(void)
     {
      HideAllContent();
      SetViewText("Regressao linear","");
      ShowLabel(m_view_title);

      ShowLabel(m_reg_period_label);
      ShowSpin(m_reg_period_spin);
      ShowLabel(m_reg_ma_type_label);
      ShowCombo(m_reg_ma_type_combo);
      ShowLabel(m_reg_price_label);
      ShowCombo(m_reg_price_combo);
     }

   void ShowKeltnerView(void)
     {
      HideAllContent();
      SetViewText("Keltner","");
      ShowLabel(m_view_title);

      ShowLabel(m_keltner_period_label);
      ShowSpin(m_keltner_period_spin);
      ShowLabel(m_keltner_deviation_label);
      ShowSpin(m_keltner_deviation_spin);
      ShowLabel(m_keltner_ma_type_label);
      ShowCombo(m_keltner_ma_type_combo);
     }

   void ShowBandasView(void)
     {
      HideAllContent();
      SetViewText("Bandas de Bollinger","");
      ShowLabel(m_view_title);
      ShowLabel(m_bbands_period_label);
      ShowSpin(m_bbands_period_spin);
      ShowLabel(m_bbands_deviation_label);
      ShowSpin(m_bbands_deviation_spin);
      ShowLabel(m_bbands_shift_label);
      ShowSpin(m_bbands_shift_spin);
      ShowLabel(m_bbands_price_label);
      ShowCombo(m_bbands_price_combo);
     }

   void ShowEnvelopesView(void)
     {
      HideAllContent();
      SetViewText("Envelopes","");
      ShowLabel(m_view_title);
      ShowLabel(m_env_period_label);
      ShowSpin(m_env_period_spin);
      ShowLabel(m_env_shift_label);
      ShowSpin(m_env_shift_spin);
      ShowLabel(m_env_ma_type_label);
      ShowCombo(m_env_ma_type_combo);
      ShowLabel(m_env_deviation_label);
      ShowSpin(m_env_deviation_spin);
     }

   void ShowEstocasticoView(void)
     {
      HideAllContent();
      SetViewText("Estocastico","");
      ShowLabel(m_view_title);
      ShowLabel(m_stoch_k_label);
      ShowSpin(m_stoch_k_spin);
      ShowLabel(m_stoch_d_label);
      ShowSpin(m_stoch_d_spin);
      ShowLabel(m_stoch_slow_label);
      ShowSpin(m_stoch_slow_spin);
      ShowLabel(m_stoch_ma_type_label);
      ShowCombo(m_stoch_ma_type_combo);
      ShowLabel(m_stoch_price_type_label);
      ShowCombo(m_stoch_price_type_combo);
     }

   void ShowMACDView(void)
     {
      HideAllContent();
      SetViewText("MACD","");
      ShowLabel(m_view_title);

      ShowLabel(m_macd_fast_label);
      ShowSpin(m_macd_fast_spin);
      ShowLabel(m_macd_slow_label);
      ShowSpin(m_macd_slow_spin);
      ShowLabel(m_macd_signal_label);
      ShowSpin(m_macd_signal_spin);
      ShowLabel(m_macd_price_label);
      ShowCombo(m_macd_price_combo);
     }

   void ShowOBVView(void)
     {
      HideAllContent();
      SetViewText("OBV","");
      ShowLabel(m_view_title);

      ShowLabel(m_obv_volume_label);
      ShowCombo(m_obv_volume_combo);
     }

   void ShowAccumDistView(void)
     {
      HideAllContent();
      SetViewText("Acumulacao/Distribuicao (A/D)","");
      ShowLabel(m_view_title);

      ShowLabel(m_ad_volume_label);
      ShowCombo(m_ad_volume_combo);
     }

   void ShowMFIView(void)
     {
      HideAllContent();
      SetViewText("MFI (Money Flow Index)","");
      ShowLabel(m_view_title);

      ShowLabel(m_mfi_period_label);
      ShowSpin(m_mfi_period_spin);
      ShowLabel(m_mfi_volume_label);
      ShowCombo(m_mfi_volume_combo);
     }

   void ShowVidyaView(void)
     {
      HideAllContent();
      SetViewText("Vidya","");
      ShowLabel(m_view_title);

      ShowLabel(m_vidya_cmo_period_label);
      ShowSpin(m_vidya_cmo_period_spin);
      ShowLabel(m_vidya_ema_period_label);
      ShowSpin(m_vidya_ema_period_spin);
      ShowLabel(m_vidya_shift_label);
      ShowSpin(m_vidya_shift_spin);
      ShowLabel(m_vidya_price_label);
      ShowCombo(m_vidya_price_combo);
     }

   void ShowTemaView(void)
     {
      HideAllContent();
      SetViewText("Tema","");
      ShowLabel(m_view_title);

      ShowLabel(m_tema_period_label);
      ShowSpin(m_tema_period_spin);
      ShowLabel(m_tema_shift_label);
      ShowSpin(m_tema_shift_spin);
      ShowLabel(m_tema_price_label);
      ShowCombo(m_tema_price_combo);
     }

   void ShowStdDevView(void)
     {
      HideAllContent();
      SetViewText("StdDev","");
      ShowLabel(m_view_title);

      ShowLabel(m_stddev_period_label);
      ShowSpin(m_stddev_period_spin);
      ShowLabel(m_stddev_ma_type_label);
      ShowCombo(m_stddev_ma_type_combo);
      ShowLabel(m_stddev_price_label);
      ShowCombo(m_stddev_price_combo);
     }

   void ShowVolumeView(void)
     {
      HideAllContent();
      SetViewText("Volume","");
      ShowLabel(m_view_title);
      ShowLabel(m_volume_type_label);
      ShowCombo(m_volume_type_combo);
     }

   void ShowATRView(void)
     {
      HideAllContent();
      SetViewText("ATR","");
      ShowLabel(m_view_title);
      ShowLabel(m_atr_period_label);
      ShowSpin(m_atr_period_spin);
     }

   void ShowParabolicSarView(void)
     {
      HideAllContent();
      SetViewText("Parabolic SAR","");
      ShowLabel(m_view_title);
      ShowLabel(m_sar_step_label);
      ShowSpin(m_sar_step_spin);
      ShowLabel(m_sar_max_label);
      ShowSpin(m_sar_max_spin);
     }

   void ApplySelectedIndicator(const int selected)
     {
      string items[];
      BuildIndicatorItems(items);
      const int safe_index=V2ClampIndex(selected,0,ArraySize(items)-1);

      if(safe_index==1)
        {
         ShowKeltnerView();
         return;
        }
      if(safe_index==3)
        {
         ShowRegressaoView();
         return;
        }
      if(safe_index==2)
        {
         ShowDonchianView();
         return;
        }
      if(safe_index==4)
        {
         ShowAfastamentoView();
         return;
        }
      if(safe_index==5)
        {
         ShowDesvioMedioView();
         return;
        }
      if(safe_index==6)
        {
         ShowAtrChannelView();
         return;
        }
      if(safe_index==7)
        {
         ShowMediaMovelView();
         return;
        }
      if(safe_index==8)
        {
         ShowBandasView();
         return;
        }
      if(safe_index==9)
        {
         ShowEnvelopesView();
         return;
        }
      if(safe_index==10)
        {
         ShowEstocasticoView();
         return;
        }
      if(safe_index==11)
        {
         ShowRSIView();
         return;
        }
      if(safe_index==12)
        {
         ShowStdDevView();
         return;
        }
      if(safe_index==13)
        {
         ShowVolumeView();
         return;
        }
      if(safe_index==14)
        {
         ShowATRView();
         return;
        }
      if(safe_index==15)
        {
         ShowParabolicSarView();
         return;
        }
      if(safe_index==16)
        {
         ShowFractalView();
         return;
        }
      if(safe_index==17)
        {
         ShowOBVView();
         return;
        }
      if(safe_index==18)
        {
         ShowMACDView();
         return;
        }
      if(safe_index==19)
        {
         ShowAccumDistView();
         return;
        }
      if(safe_index==20)
        {
         ShowMFIView();
         return;
        }
      if(safe_index==21)
        {
         ShowVidyaView();
         return;
        }
      if(safe_index==22)
        {
         ShowTemaView();
         return;
        }

      string placeholder_title;
      string placeholder_body;
      BuildPlaceholderText(items[safe_index],placeholder_title,placeholder_body);
      ShowPlaceholderView(placeholder_title,placeholder_body);
     }

   void HideCardContent(void)
     {
      HideAllContent();
     }

   void HideSlot(void)
     {
      HideCardContent();
      HideFrame(m_body);
      HideCombo(m_combo);
      HideLabel(m_combo_label);
      HideLabel(m_title);
      HideFrame(m_card);
     }

   void ShowSlot(void)
     {
      ShowFrame(m_card);
      ShowLabel(m_title);
      ShowLabel(m_combo_label);
      ShowCombo(m_combo);
      ShowFrame(m_body);
     }

public:
                     CTab8MontarSlotCard(void) : m_host(NULL), m_tabs(NULL), m_created(false), m_is_active(false), m_window_index(-1), m_tab_index(-1), m_slot_index(-1), m_last_selected_index(-1) {}

   bool Create(CEF_CWndCreate &host,const int window_index,CEF_CTabs &tabs,const int tab_index,const int slot_index,
               const int x,const int y,const int w,const int h)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_tabs=&tabs;
      m_window_index=window_index;
      m_tab_index=tab_index;
      m_slot_index=slot_index;

      const color card_back=V2_COLOR_CARD_BACK;
      const color card_border=V2_COLOR_CARD_BORDER;
      const color field_border=V2_COLOR_FIELD_BORDER;
      const color sub_back=V2_COLOR_SURFACE;
      const int outer_pad=8;
      const int body_w=w-(outer_pad*2);
      const int body_x=x+outer_pad;
      const int body_y=y+74;
      const int body_h=h-82;
      const int content_x=12;
      const int content_y=10;
      const int inner_w=body_w-(content_x*2);

      if(!V2CreateCard(*m_host,m_card,tabs,m_window_index,m_tab_index,x,y,w,h,card_back,card_border))
         return(false);

      const string title_text=StringFormat("Indicador %d",m_slot_index+1);
      if(!V2CreateCardTitle(*m_host,m_title,title_text,m_card,tabs,m_window_index,m_tab_index,16,12,w-32))
         return(false);

      if(!V2CreateFieldLabel(*m_host,m_combo_label,"Indicador",m_card,tabs,m_window_index,m_tab_index,16,32,w-32,16))
         return(false);

      string indicator_items[];
      BuildIndicatorItems(indicator_items);
      if(!CreateComboControl(m_combo,m_card,16,46,w-32,220,indicator_items,0,field_border))
         return(false);

      if(!V2CreateCard(*m_host,m_body,tabs,m_window_index,m_tab_index,body_x,body_y,body_w,body_h,sub_back,card_border))
         return(false);

      if(!CreateBodyLabel(m_view_title,"Nao usar",m_body,content_x,content_y,inner_w,16,11,V2_COLOR_TEXT_PRIMARY))
         return(false);
      if(!CreateBodyLabel(m_view_note,"Este slot nao participa da composicao do sinal enquanto estiver desativado.",m_body,content_x,content_y+24,inner_w,72,10,V2_COLOR_TEXT_SECONDARY))
         return(false);

      string price_items[];
      ArrayResize(price_items,7);
      price_items[0]="Fechamento";
      price_items[1]="Abertura";
      price_items[2]="Maximo";
      price_items[3]="Minimo";
      price_items[4]="Mediano";
      price_items[5]="Tipico";
      price_items[6]="Medio";

      string ma_type_items[];
      ArrayResize(ma_type_items,5);
      ma_type_items[0]="Simples";
      ma_type_items[1]="Exponencial";
      ma_type_items[2]="Suavizada";
      ma_type_items[3]="Linear ponderada";
      ma_type_items[4]="Smoothed";

      string volume_items[];
      ArrayResize(volume_items,2);
      volume_items[0]="Tick";
      volume_items[1]="Real";

      string stoch_type_items[];
      ArrayResize(stoch_type_items,2);
      stoch_type_items[0]="Minimo/Maximo";
      stoch_type_items[1]="Fechamento/Fechamento";

      int y_cursor=content_y+18;
      if(!CreateBodyLabel(m_keltner_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_keltner_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"20",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_keltner_deviation_label,"Desvio",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_keltner_deviation_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,0.1,1,"2.0",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_keltner_ma_type_label,"Tipo de media",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_keltner_ma_type_combo,m_body,content_x,y_cursor,inner_w,140,ma_type_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_donchian_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_donchian_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"21",sub_back,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_afast_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_afast_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"14",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_afast_shift_label,"Deslocamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_afast_shift_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"0",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_afast_ma_type_label,"Tipo de media",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_afast_ma_type_combo,m_body,content_x,y_cursor,inner_w,140,ma_type_items,0,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_afast_price_label,"Modo de preco",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_afast_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_desvio_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_desvio_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"14",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_desvio_ma_type_label,"Tipo de media",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_desvio_ma_type_combo,m_body,content_x,y_cursor,inner_w,140,ma_type_items,0,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_desvio_price_label,"Modo de fechamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_desvio_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_atr_channel_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_atr_channel_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"20",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_atr_channel_deviation_label,"Desvio",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_atr_channel_deviation_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"0",sub_back,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_ma_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_ma_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"14",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_ma_shift_label,"Deslocamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_ma_shift_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"0",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_ma_type_label,"Tipo de media",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_ma_type_combo,m_body,content_x,y_cursor,inner_w,120,ma_type_items,0,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_ma_price_label,"Modo de preco",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_ma_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_bbands_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_bbands_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"14",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_bbands_deviation_label,"Desvio",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_bbands_deviation_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,0.1,1,"2.0",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_bbands_shift_label,"Deslocamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_bbands_shift_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"0",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_bbands_price_label,"Modo de preco",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_bbands_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_env_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_env_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"14",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_env_shift_label,"Deslocamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_env_shift_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"0",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_env_ma_type_label,"Tipo de media",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_env_ma_type_combo,m_body,content_x,y_cursor,inner_w,140,ma_type_items,0,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_env_deviation_label,"Desvio",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_env_deviation_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,0.1,1,"0.0",sub_back,field_border))
         return(false);

      y_cursor=content_y+18;
      const int stoch_col_gap=10;
      const int stoch_half_w=(inner_w-stoch_col_gap)/2;
      const int stoch_right_x=content_x+stoch_half_w+stoch_col_gap;

      if(!CreateBodyLabel(m_stoch_k_label,"K periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_stoch_k_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"5",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_stoch_d_label,"D periodo",m_body,content_x,y_cursor,stoch_half_w,16))
         return(false);
      if(!CreateBodyLabel(m_stoch_slow_label,"Lentidao",m_body,stoch_right_x,y_cursor,stoch_half_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_stoch_d_spin,m_body,content_x,y_cursor,stoch_half_w,9999.0,1.0,1.0,0,"3",sub_back,field_border))
         return(false);
      if(!CreateSpinControl(m_stoch_slow_spin,m_body,stoch_right_x,y_cursor,stoch_half_w,9999.0,1.0,1.0,0,"3",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_stoch_ma_type_label,"Tipo de media",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_stoch_ma_type_combo,m_body,content_x,y_cursor,inner_w,140,ma_type_items,0,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_stoch_price_type_label,"Tipo de estocastico",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_stoch_price_type_combo,m_body,content_x,y_cursor,inner_w,100,stoch_type_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_rsi_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_rsi_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"14",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_rsi_price_label,"Modo de preco",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_rsi_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_reg_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_reg_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"20",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_reg_ma_type_label,"Tipo de regressao",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_reg_ma_type_combo,m_body,content_x,y_cursor,inner_w,140,ma_type_items,0,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_reg_price_label,"Modo de fechamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_reg_price_combo,m_body,content_x,y_cursor,inner_w,140,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_macd_fast_label,"EMA rapida",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_macd_fast_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"12",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_macd_slow_label,"EMA lenta",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_macd_slow_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"26",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_macd_signal_label,"Sinal",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_macd_signal_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"9",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_macd_price_label,"Modo de preco",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_macd_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_ad_volume_label,"Volume",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_ad_volume_combo,m_body,content_x,y_cursor,inner_w,80,volume_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_mfi_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_mfi_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"14",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_mfi_volume_label,"Volume",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_mfi_volume_combo,m_body,content_x,y_cursor,inner_w,80,volume_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_vidya_cmo_period_label,"Periodo CMO",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_vidya_cmo_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"9",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_vidya_ema_period_label,"Periodo EMA",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_vidya_ema_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"12",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_vidya_shift_label,"Deslocamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_vidya_shift_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"0",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_vidya_price_label,"Modo de preco",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_vidya_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_tema_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_tema_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"14",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_tema_shift_label,"Deslocamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_tema_shift_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,1.0,0,"0",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_tema_price_label,"Modo de preco",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_tema_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_obv_volume_label,"Volume",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_obv_volume_combo,m_body,content_x,y_cursor,inner_w,80,volume_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_stddev_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_stddev_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"20",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_stddev_ma_type_label,"Tipo de desvio",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_stddev_ma_type_combo,m_body,content_x,y_cursor,inner_w,140,ma_type_items,0,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_stddev_price_label,"Modo de fechamento",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_stddev_price_combo,m_body,content_x,y_cursor,inner_w,160,price_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_volume_type_label,"Volume",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_volume_type_combo,m_body,content_x,y_cursor,inner_w,80,volume_items,0,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_atr_period_label,"Periodo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_atr_period_spin,m_body,content_x,y_cursor,inner_w,9999.0,1.0,1.0,0,"14",sub_back,field_border))
         return(false);

      y_cursor=content_y+18;
      if(!CreateBodyLabel(m_sar_step_label,"Passo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_sar_step_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,0.01,2,"0.02",sub_back,field_border))
         return(false);
      y_cursor+=22;
      if(!CreateBodyLabel(m_sar_max_label,"Maximo",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateSpinControl(m_sar_max_spin,m_body,content_x,y_cursor,inner_w,9999.0,0.0,0.01,2,"0.20",sub_back,field_border))
         return(false);

      m_combo.SelectItem(0);
      HideSlot();
      m_last_selected_index=-1;
      m_created=true;
      return(true);
     }

   void RefreshView(void)
     {
      if(!m_created || !m_is_active)
         return;

      const int selected=V2ClampIndex(m_combo.GetListViewPointer().SelectedItemIndex(),0,22);
      m_last_selected_index=selected;
      ApplySelectedIndicator(selected);
     }

   void SetActive(const bool active)
     {
      if(!m_created)
         return;

      m_is_active=active;
      if(!active)
        {
         HideSlot();
         return;
        }

      ShowSlot();
      RefreshView();
     }

   void OnTimerEvent(void)
     {
      if(!m_created || !m_is_active)
         return;

      const int selected=V2ClampIndex(m_combo.GetListViewPointer().SelectedItemIndex(),0,22);
      if(selected!=m_last_selected_index)
        {
         m_last_selected_index=selected;
         ApplySelectedIndicator(selected);
        }
     }

   int SelectedIndicatorIndex(void)
     {
      if(!m_created)
         return(0);
      if(m_last_selected_index>=0)
         return(V2ClampIndex(m_last_selected_index,0,22));
      return(V2ClampIndex(m_combo.GetListViewPointer().SelectedItemIndex(),0,22));
    }
  };

#endif // __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__
