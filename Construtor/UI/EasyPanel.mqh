#ifndef __CONSTRUTOR_EASY_PANEL_MQH__
#define __CONSTRUTOR_EASY_PANEL_MQH__

// EasyAndFastGUI shares class names with MQL5 <Controls\...> (CButton, CScroll, etc.).
// To allow both frameworks in the same compilation unit, we rename the EasyAndFastGUI
// identifiers via preprocessor macros for this include only.
#define CButton       CEF_CButton
#define CButtonsGroup CEF_CButtonsGroup
#define CCalendar     CEF_CCalendar
#define CCheckBox     CEF_CCheckBox
#define CContextMenu  CEF_CContextMenu
#define CComboBox     CEF_CComboBox
#define CDropCalendar CEF_CDropCalendar
#define CFileNavigator CEF_CFileNavigator
#define CFrame        CEF_CFrame
#define CGraph        CEF_CGraph
#define CScroll       CEF_CScroll
#define CScrollV      CEF_CScrollV
#define CScrollH      CEF_CScrollH
#define CListView     CEF_CListView
#define CMenuBar      CEF_CMenuBar
#define CMenuItem     CEF_CMenuItem
#define CProgressBar  CEF_CProgressBar
#define CSeparateLine CEF_CSeparateLine
#define CSlider       CEF_CSlider
#define CSplitButton  CEF_CSplitButton
#define CStandardChart CEF_CStandardChart
#define CStatusBar    CEF_CStatusBar
#define CTable        CEF_CTable
#define CTabs         CEF_CTabs
#define CTextBox      CEF_CTextBox
#define CTextEdit     CEF_CTextEdit
#define CWndContainer CEF_CWndContainer
#define CWndEvents    CEF_CWndEvents
#define CWndCreate    CEF_CWndCreate
#define CTimeEdit     CEF_CTimeEdit
#define CTooltip      CEF_CTooltip
#define CTreeItem     CEF_CTreeItem
#define CTreeView     CEF_CTreeView
#define CWindow       CEF_CWindow
#define CTextLabel    CEF_CTextLabel

#include "..\\..\\EasyAndFastGUI\\WndCreate.mqh"

#undef CTextLabel
#undef CWindow
#undef CTreeView
#undef CTreeItem
#undef CTooltip
#undef CTimeEdit
#undef CWndCreate
#undef CWndEvents
#undef CWndContainer
#undef CTextEdit
#undef CTextBox
#undef CTabs
#undef CTable
#undef CStatusBar
#undef CStandardChart
#undef CSplitButton
#undef CSlider
#undef CSeparateLine
#undef CProgressBar
#undef CMenuItem
#undef CMenuBar
#undef CListView
#undef CScrollH
#undef CScrollV
#undef CScroll
#undef CGraph
#undef CFrame
#undef CFileNavigator
#undef CDropCalendar
#undef CComboBox
#undef CContextMenu
#undef CCheckBox
#undef CCalendar
#undef CButtonsGroup
#undef CButton

class CConstrutorEasyPanel : public CEF_CWndCreate
  {
private:
   enum
     {
      TOP_TAB_COUNT=2,
      EASY_TAB_COUNT=10
     };
   bool              m_created;
   bool              m_visible;
   int               m_window_index;
   int               m_top_tab_last;
   bool              m_signal_is_buy;
   CEF_CWindow       m_window;
   CEF_CTextLabel    m_title;
   CEF_CTextLabel    m_note;
   CEF_CTabs         m_top_tabs;
   CEF_CTextLabel    m_top_placeholder;
   CEF_CButton       m_btn_refresh;
   CEF_CTabs         m_tabs;
   CEF_CTextLabel    m_tab_placeholders[EASY_TAB_COUNT];
   CEF_CTextLabel    m_tab_headers_title[EASY_TAB_COUNT];
   CEF_CTextLabel    m_tab_headers_note[EASY_TAB_COUNT];
   CEF_CCheckBox     m_tab_signal_buy[EASY_TAB_COUNT];
   CEF_CCheckBox     m_tab_signal_sell[EASY_TAB_COUNT];
   CEF_CTextLabel    m_tab_signal_info[EASY_TAB_COUNT];

   // Tab 2 (Stop loss)
   CEF_CFrame        m_tab2_card_stopfix;
   CEF_CTextLabel    m_tab2_card_title;
   CEF_CCheckBox     m_tab2_use_fixed;
   CEF_CFrame        m_tab2_card_calc;
   CEF_CTextLabel    m_tab2_card_calc_title;
   CEF_CCheckBox     m_tab2_use_calc;
   CEF_CFrame        m_tab2_card_mult;
   CEF_CTextLabel    m_tab2_card_mult_title;
   CEF_CCheckBox     m_tab2_use_mult;
   CEF_CTextLabel    m_tab2_mult_base_label;
   CEF_CComboBox     m_tab2_mult_base_combo;
   CEF_CTextLabel    m_tab2_mult_candle_label;
   CEF_CComboBox     m_tab2_mult_candle_combo;
   CEF_CTextLabel    m_tab2_mult_qty_label;
   CEF_CTextEdit     m_tab2_mult_qty_spin;
   CEF_CTabs         m_tab2_calc_tabs;
   CEF_CTextLabel    m_tab2_calc_ref_placeholder;
   CEF_CTextLabel    m_tab2_calc_media_placeholder;
   CEF_CTextLabel    m_tab2_calc_maxmin_placeholder;
   CEF_CCheckBox     m_tab2_calc_ref_check;
   CEF_CCheckBox     m_tab2_calc_media_check;
   CEF_CCheckBox     m_tab2_calc_maxmin_check;
   CEF_CFrame        m_tab2_calc_ref_card;
   CEF_CTextLabel    m_tab2_calc_ref_base_label;
   CEF_CComboBox     m_tab2_calc_ref_base_combo;
   CEF_CTextLabel    m_tab2_calc_ref_candle_label;
   CEF_CComboBox     m_tab2_calc_ref_candle_combo;
   CEF_CTextLabel    m_tab2_calc_ref_distance_label;
   CEF_CTextEdit     m_tab2_calc_ref_distance_spin;
   CEF_CTextLabel    m_tab2_calc_ref_expire_label;
   CEF_CComboBox     m_tab2_calc_ref_expire_combo;

   CEF_CFrame        m_tab2_calc_media_card;
   CEF_CTextLabel    m_tab2_calc_media_candles_label;
   CEF_CTextEdit     m_tab2_calc_media_candles_spin;
   CEF_CTextLabel    m_tab2_calc_media_base_label;
   CEF_CComboBox     m_tab2_calc_media_base_combo;
   CEF_CTextLabel    m_tab2_calc_media_distance_label;
   CEF_CTextEdit     m_tab2_calc_media_distance_spin;
   CEF_CTextLabel    m_tab2_calc_media_expire_label;
   CEF_CComboBox     m_tab2_calc_media_expire_combo;
   CEF_CFrame        m_tab2_calc_maxmin_card;
   CEF_CTextLabel    m_tab2_calc_maxmin_base_label;
   CEF_CComboBox     m_tab2_calc_maxmin_base_combo;
   CEF_CTextLabel    m_tab2_calc_maxmin_count_label;
   CEF_CTextEdit     m_tab2_calc_maxmin_count_spin;
   CEF_CTextLabel    m_tab2_calc_type_label;
   CEF_CComboBox     m_tab2_calc_type;
   CEF_CTextLabel    m_tab2_dist_label;
   CEF_CTextEdit     m_tab2_dist_spin;

   // Tab 3 (Stop movel)
   CEF_CTextLabel    m_tab3_calc_type_label;
   CEF_CComboBox     m_tab3_calc_type;
   CEF_CFrame        m_tab3_card_padrao;
   CEF_CTextLabel    m_tab3_card_padrao_title;
   CEF_CCheckBox     m_tab3_use_padrao;
   CEF_CTextLabel    m_tab3_dist_label;
   CEF_CTextEdit     m_tab3_dist_spin;
   CEF_CTextLabel    m_tab3_passo_label;
   CEF_CTextEdit     m_tab3_passo_spin;
   CEF_CFrame        m_tab3_card_candles;
   CEF_CTextLabel    m_tab3_card_candles_title;
   CEF_CCheckBox     m_tab3_use_candles;
   CEF_CTextLabel    m_tab3_candles_trigger_label;
   CEF_CTextEdit     m_tab3_candles_trigger_spin;
   CEF_CTextLabel    m_tab3_candles_pos_label;
   CEF_CComboBox     m_tab3_candles_pos_combo;
   CEF_CTextLabel    m_tab3_candles_candle_label;
   CEF_CComboBox     m_tab3_candles_candle_combo;
   CEF_CTextLabel    m_tab3_candles_refdist_label;
   CEF_CTextEdit     m_tab3_candles_refdist_spin;
   CEF_CFrame        m_tab3_card_indicador;
   CEF_CTextLabel    m_tab3_card_indicador_title;
   CEF_CCheckBox     m_tab3_use_indicador;
   CEF_CTextLabel    m_tab3_indic_trigger_label;
   CEF_CTextEdit     m_tab3_indic_trigger_spin;
   CEF_CTextLabel    m_tab3_indic_combo_label;
   CEF_CComboBox     m_tab3_indic_combo;
   CEF_CTextLabel    m_tab4_calc_type_label;
   CEF_CComboBox     m_tab4_calc_type;
   CEF_CFrame        m_tab4_card_takefix;
   CEF_CTextLabel    m_tab4_card_takefix_title;
   CEF_CCheckBox     m_tab4_use_fixed;
   CEF_CTextLabel    m_tab4_dist_label;
   CEF_CTextEdit     m_tab4_dist_spin;

   // Tab 4 (Take profit calc)
   CEF_CFrame        m_tab4_card_calc;
   CEF_CTextLabel    m_tab4_card_calc_title;
   CEF_CCheckBox     m_tab4_use_calc;
   CEF_CTabs         m_tab4_calc_tabs;
   CEF_CCheckBox     m_tab4_calc_ref_check;
   CEF_CCheckBox     m_tab4_calc_media_check;
   CEF_CCheckBox     m_tab4_calc_maxmin_check;
   CEF_CFrame        m_tab4_calc_ref_card;
   CEF_CTextLabel    m_tab4_calc_ref_base_label;
   CEF_CComboBox     m_tab4_calc_ref_base_combo;
   CEF_CTextLabel    m_tab4_calc_ref_candle_label;
   CEF_CComboBox     m_tab4_calc_ref_candle_combo;
   CEF_CTextLabel    m_tab4_calc_ref_distance_label;
   CEF_CTextEdit     m_tab4_calc_ref_distance_spin;
   CEF_CTextLabel    m_tab4_calc_ref_expire_label;
   CEF_CComboBox     m_tab4_calc_ref_expire_combo;
   CEF_CFrame        m_tab4_calc_media_card;
   CEF_CTextLabel    m_tab4_calc_media_candles_label;
   CEF_CTextEdit     m_tab4_calc_media_candles_spin;
   CEF_CTextLabel    m_tab4_calc_media_base_label;
   CEF_CComboBox     m_tab4_calc_media_base_combo;
   CEF_CTextLabel    m_tab4_calc_media_distance_label;
   CEF_CTextEdit     m_tab4_calc_media_distance_spin;
   CEF_CTextLabel    m_tab4_calc_media_expire_label;
   CEF_CComboBox     m_tab4_calc_media_expire_combo;
   CEF_CFrame        m_tab4_calc_maxmin_card;
   CEF_CTextLabel    m_tab4_calc_maxmin_base_label;
   CEF_CComboBox     m_tab4_calc_maxmin_base_combo;
   CEF_CTextLabel    m_tab4_calc_maxmin_count_label;
   CEF_CTextEdit     m_tab4_calc_maxmin_count_spin;

   // Tab 4 (Take profit multiplicador) - espelho do Stop loss mult
   CEF_CFrame        m_tab4_card_mult;
   CEF_CTextLabel    m_tab4_card_mult_title;
   CEF_CCheckBox     m_tab4_use_mult;
   CEF_CTextLabel    m_tab4_mult_base_label;
   CEF_CComboBox     m_tab4_mult_base_combo;
   CEF_CTextLabel    m_tab4_mult_candle_label;
   CEF_CComboBox     m_tab4_mult_candle_combo;
   CEF_CTextLabel    m_tab4_mult_qty_label;
   CEF_CTextEdit     m_tab4_mult_qty_spin;

   // Tab 4 (Take profit indicador) - espelho do Stop movel indicador
   CEF_CFrame        m_tab4_card_indicador;
   CEF_CTextLabel    m_tab4_card_indicador_title;
   CEF_CCheckBox     m_tab4_use_indicador;
   CEF_CTextLabel    m_tab4_indic_trigger_label;
   CEF_CTextEdit     m_tab4_indic_trigger_spin;
   CEF_CTextLabel    m_tab4_indic_combo_label;
   CEF_CComboBox     m_tab4_indic_combo;

   // Tab 5 (Break even)
   CEF_CTextLabel    m_tab5_padrao_label;
   CEF_CComboBox     m_tab5_padrao_combo;
   CEF_CFrame        m_tab5_card_breakeven;
   CEF_CTextLabel    m_tab5_card_breakeven_title;
   CEF_CCheckBox     m_tab5_use_breakeven;
   CEF_CTextLabel    m_tab5_inicio_label;
   CEF_CTextEdit     m_tab5_inicio_spin;
   CEF_CTextLabel    m_tab5_dist_label;
   CEF_CTextEdit     m_tab5_dist_spin;

   // Tab 6 (Trailing stop)
   CEF_CTextLabel    m_tab6_calc_type_label;
   CEF_CComboBox     m_tab6_calc_type;
   CEF_CFrame        m_tab6_card_padrao;
   CEF_CTextLabel    m_tab6_card_padrao_title;
   CEF_CCheckBox     m_tab6_use_padrao;
   CEF_CTextLabel    m_tab6_dist_label;
   CEF_CTextEdit     m_tab6_dist_spin;
   CEF_CTextLabel    m_tab6_passo_label;
   CEF_CTextEdit     m_tab6_passo_spin;
   CEF_CFrame        m_tab6_card_candles;
   CEF_CTextLabel    m_tab6_card_candles_title;
   CEF_CCheckBox     m_tab6_use_candles;
   CEF_CTextLabel    m_tab6_candles_trigger_label;
   CEF_CTextEdit     m_tab6_candles_trigger_spin;
   CEF_CTextLabel    m_tab6_candles_pos_label;
   CEF_CComboBox     m_tab6_candles_pos_combo;
   CEF_CTextLabel    m_tab6_candles_candle_label;
   CEF_CComboBox     m_tab6_candles_candle_combo;
   CEF_CTextLabel    m_tab6_candles_refdist_label;
   CEF_CTextEdit     m_tab6_candles_refdist_spin;
   CEF_CFrame        m_tab6_card_indicador;
   CEF_CTextLabel    m_tab6_card_indicador_title;
   CEF_CCheckBox     m_tab6_use_indicador;
   CEF_CTextLabel    m_tab6_indic_trigger_label;
   CEF_CTextEdit     m_tab6_indic_trigger_spin;
   CEF_CTextLabel    m_tab6_indic_combo_label;
   CEF_CComboBox     m_tab6_indic_combo;

   // Tab 7 (Saidas parciais)
   CEF_CTextLabel    m_tab7_padrao_label;
   CEF_CComboBox     m_tab7_padrao_combo;

	   // Tab 1 (Inf. Iniciais) - styled preview
	   CEF_CFrame        m_tab1_card_left;
	   CEF_CFrame        m_tab1_card_right;
	   CEF_CFrame        m_tab1_card_schedule;
	   CEF_CFrame        m_tab1_card_config;
	   CEF_CSeparateLine m_tab1_card_schedule_sep;
	   CEF_CTextLabel    m_tab1_card_left_title;
	   CEF_CTextLabel    m_tab1_card_right_title;
	   CEF_CTextLabel    m_tab1_card_schedule_title;
	   CEF_CTextLabel    m_tab1_card_config_title;
	   CEF_CTextLabel    m_tab1_name_label;
	   CEF_CTextEdit     m_tab1_name;
	   CEF_CTextLabel    m_tab1_market_label;
	   CEF_CComboBox     m_tab1_market;
   CEF_CTextLabel    m_tab1_oper_label;
   CEF_CComboBox     m_tab1_oper;
   CEF_CTextLabel    m_tab1_mode_label;
   CEF_CComboBox     m_tab1_mode;
   CEF_CTextLabel    m_tab1_buy_label;
   CEF_CComboBox     m_tab1_buy;
	   CEF_CTextLabel    m_tab1_sell_label;
	   CEF_CComboBox     m_tab1_sell;

	   // Tab 1 config inicial (from original Tab 3)
	   CEF_CTextLabel    m_tab1_tempo_label;
	   CEF_CComboBox     m_tab1_tempo_combo;
	   CEF_CTextLabel    m_tab1_volume_label;
	   CEF_CTextEdit     m_tab1_volume_edit;
	   CEF_CTextLabel    m_tab1_spread_label;
	   CEF_CTextEdit     m_tab1_spread_edit;

	   // Tab 1 extra card (Horario / Zeragem) - merged from original Tab 2
	   CEF_CTextLabel    m_tab1_start_label;
	   CEF_CTextLabel    m_tab1_start_hour_label;
	   CEF_CComboBox     m_tab1_start_hour_combo;
	   CEF_CTextLabel    m_tab1_start_min_label;
	   CEF_CComboBox     m_tab1_start_min_combo;
	   CEF_CTextLabel    m_tab1_end_label;
	   CEF_CTextLabel    m_tab1_end_hour_label;
	   CEF_CComboBox     m_tab1_end_hour_combo;
	   CEF_CTextLabel    m_tab1_end_min_label;
	   CEF_CComboBox     m_tab1_end_min_combo;
	   CEF_CTextLabel    m_tab1_zero_label;
	   CEF_CComboBox     m_tab1_zero_combo;
	   CEF_CTextLabel    m_tab1_zero_time_label;
	   CEF_CTextLabel    m_tab1_zero_hour_label;
	   CEF_CComboBox     m_tab1_zero_hour_combo;
   CEF_CTextLabel    m_tab1_zero_min_label;
   CEF_CComboBox     m_tab1_zero_min_combo;

private:
   static int ClampInt(const int value,const int min_value,const int max_value)
     {
      if(value<min_value) return(min_value);
      if(value>max_value) return(max_value);
      return(value);
     }

   static bool TryParseHourMin(const string text,int &hour,int &min)
     {
      hour=0;
      min=0;
      const int sep=StringFind(text,":");
      if(sep==WRONG_VALUE)
         return(false);
      const string sh=StringSubstr(text,0,sep);
      const string sm=StringSubstr(text,sep+1);
      const int h=(int)StringToInteger(sh);
      const int m=(int)StringToInteger(sm);
      if(h<0 || h>23 || m<0 || m>59)
         return(false);
      hour=h;
      min=m;
      return(true);
     }

   void UpdateSignalUI(void)
     {
      const string msg_buy="Voce esta criando um sinal de compra, o de venda sera gerado automaticamente.";
      const string msg_sell="Voce esta criando um sinal de venda, o de compra sera gerado automaticamente.";
      const string msg=(m_signal_is_buy ? msg_buy : msg_sell);

      for(int i=1; i<EASY_TAB_COUNT; i++)
        {
         m_tab_signal_buy[i].IsPressed(m_signal_is_buy);
         m_tab_signal_sell[i].IsPressed(!m_signal_is_buy);
         m_tab_signal_info[i].LabelText(msg);

         m_tab_signal_buy[i].Update(true);
         m_tab_signal_sell[i].Update(true);
         m_tab_signal_info[i].Update(true);
        }
     }

   void LoadSettingsToControls(const SConstrutorSettings &settings)
     {
      // Tab 1 (Inf. Iniciais + Horario + Config inicial)
      m_tab1_name.SetValue(settings.estrategia_nome);
      m_tab1_market.SelectItem(ClampInt((int)settings.mercado,0,1));
      m_tab1_oper.SelectItem(ClampInt((int)settings.tipo_operacional,0,1));
      m_tab1_mode.SelectItem(ClampInt((int)settings.modo_processamento,0,1));

      // Buy/Sell combos are [Sim, Nao] (in this file), while enum is [Nao=0, Sim=1]
      m_tab1_buy.SelectItem(settings.operar_compra==CONSTRUTOR_SIM ? 0 : 1);
      m_tab1_sell.SelectItem(settings.operar_venda==CONSTRUTOR_SIM ? 0 : 1);

      m_tab1_start_hour_combo.SelectItem(ClampInt(settings.inicio_hora,0,23));
      m_tab1_start_min_combo.SelectItem(ClampInt(settings.inicio_minuto,0,59));
      m_tab1_end_hour_combo.SelectItem(ClampInt(settings.fim_hora,0,23));
      m_tab1_end_min_combo.SelectItem(ClampInt(settings.fim_minuto,0,59));

      m_tab1_zero_combo.SelectItem(ClampInt((int)settings.zerar_posicoes,0,1)); // items are [Nao, Sim]

      int zh=17, zm=30;
      if(TryParseHourMin(settings.horario_zeragem,zh,zm))
        {
         m_tab1_zero_hour_combo.SelectItem(ClampInt(zh,0,23));
         m_tab1_zero_min_combo.SelectItem(ClampInt(zm,0,59));
        }

      m_tab1_tempo_combo.SelectItem(ClampInt((int)settings.tempo_grafico,0,20));
      m_tab1_volume_edit.SetValue(DoubleToString(settings.volume_inicial,2));
      m_tab1_spread_edit.SetValue(IntegerToString(settings.spread_maximo));

      // Tab 2 (Stop loss)
      const bool use_calc=(settings.stop_calculo==CONSTRUTOR_SIM);
      const bool use_mult=(!use_calc && settings.stop_calculo_multiplicar==CONSTRUTOR_SIM);
      const bool use_fixed=(!use_calc && !use_mult && settings.stop_fixo==CONSTRUTOR_SIM);
      m_tab2_use_calc.IsPressed(use_calc);
      m_tab2_use_fixed.IsPressed(use_fixed);
      m_tab2_use_mult.IsPressed(use_mult);
      m_tab2_calc_type.SelectItem(ClampInt((int)settings.tipo_stop_loss,0,1));
      m_tab2_dist_spin.SetValue(DoubleToString(settings.stop_fixo_distancia,1));
      m_tab2_calc_ref_check.IsPressed(settings.stop_calculo_referencia==CONSTRUTOR_SIM);
      m_tab2_calc_media_check.IsPressed(settings.stop_calculo_media==CONSTRUTOR_SIM);
      m_tab2_calc_maxmin_check.IsPressed(settings.stop_calculo_maxmin==CONSTRUTOR_SIM);
      m_tab2_calc_maxmin_base_combo.SelectItem(ClampInt((int)settings.stop_calculo_maxmin_base,0,3));
      m_tab2_calc_maxmin_count_spin.SetValue(IntegerToString(settings.stop_calculo_maxmin_ultimos>0 ? settings.stop_calculo_maxmin_ultimos : 3));
      m_tab2_calc_ref_base_combo.SelectItem(ClampInt((int)settings.stop_calculo_referencia_base,0,3));
      m_tab2_calc_ref_candle_combo.SelectItem(ClampInt((int)settings.stop_calculo_referencia_posicao,0,3));
      m_tab2_calc_ref_distance_spin.SetValue(DoubleToString(settings.stop_calculo_referencia_distancia,1));
      m_tab2_calc_ref_expire_combo.SelectItem(ClampInt(settings.stop_calculo_referencia_expirar,0,4));
      m_tab2_calc_media_candles_spin.SetValue(IntegerToString(settings.stop_calculo_media_qtd_candles));
      m_tab2_calc_media_base_combo.SelectItem(ClampInt((int)settings.stop_calculo_media_base,0,3));
      m_tab2_calc_media_distance_spin.SetValue(DoubleToString(settings.stop_calculo_media_distancia,1));
      m_tab2_calc_media_expire_combo.SelectItem(ClampInt(settings.stop_calculo_media_expirar,0,4));
      m_tab2_mult_base_combo.SelectItem(ClampInt((int)settings.stop_calculo_multiplicar_base,0,1));
      m_tab2_mult_candle_combo.SelectItem(ClampInt(settings.stop_calculo_multiplicar_candle,0,3));
      m_tab2_mult_qty_spin.SetValue(DoubleToString(settings.stop_calculo_multiplicar_qtd,2));

      // Tab 3 (Stop movel)
      m_tab3_calc_type.SelectItem(ClampInt((int)settings.tipo_stop_movel,0,1));
      const bool use_padrao=(settings.stop_movel==CONSTRUTOR_SIM && settings.stop_movel_modo==CONSTRUTOR_STOP_MOVEL_PADRAO);
      const bool use_candles=(settings.stop_movel==CONSTRUTOR_SIM && settings.stop_movel_modo==CONSTRUTOR_STOP_MOVEL_CANDLES);
      const bool use_indicador=(settings.stop_movel==CONSTRUTOR_SIM && settings.stop_movel_modo==CONSTRUTOR_STOP_MOVEL_INDICADOR);
      m_tab3_use_padrao.IsPressed(use_padrao);
      m_tab3_use_candles.IsPressed(use_candles);
      m_tab3_use_indicador.IsPressed(use_indicador);
      m_tab3_dist_spin.SetValue(IntegerToString(settings.stop_movel_padrao_adicionar_favor));
      m_tab3_passo_spin.SetValue(IntegerToString(settings.stop_movel_padrao_passo));
      m_tab3_candles_trigger_spin.SetValue(DoubleToString(settings.stop_movel_candles_disparo_distancia,1));
      m_tab3_candles_pos_combo.SelectItem(ClampInt((int)settings.stop_movel_candles_posicao,0,3));
      m_tab3_candles_candle_combo.SelectItem(ClampInt((int)settings.stop_movel_candles_candle_posicao,0,3));
      m_tab3_candles_refdist_spin.SetValue(DoubleToString(settings.stop_movel_candles_distancia,1));
      m_tab3_indic_trigger_spin.SetValue(DoubleToString(settings.stop_movel_indicador_disparo_distancia,1));
      m_tab3_indic_combo.SelectItem(settings.stop_movel_indicador==CONSTRUTOR_STOP_IND_PARABOLIC_SAR ? 1 : 0);

      // Tab 4 (Take profit)
      m_tab4_calc_type.SelectItem(ClampInt((int)settings.tipo_take_profit,0,1));
      const bool use_indic_tp=(settings.take_indicador==CONSTRUTOR_SIM);
      const bool use_mult_tp=(!use_indic_tp && settings.take_calculo_multiplicar==CONSTRUTOR_SIM);
      const bool use_calc_tp=(!use_indic_tp && !use_mult_tp && settings.take_calculo==CONSTRUTOR_SIM);
      const bool use_fixed_tp=(!use_indic_tp && !use_mult_tp && !use_calc_tp && settings.take_fixo==CONSTRUTOR_SIM);
      m_tab4_use_calc.IsPressed(use_calc_tp);
      m_tab4_use_fixed.IsPressed(use_fixed_tp);
      m_tab4_use_mult.IsPressed(use_mult_tp);
      m_tab4_use_indicador.IsPressed(use_indic_tp);
      m_tab4_dist_spin.SetValue(DoubleToString(settings.take_fixo_distancia,1));
      m_tab4_calc_ref_check.IsPressed(settings.take_calculo_referencia==CONSTRUTOR_SIM);
      m_tab4_calc_media_check.IsPressed(settings.take_calculo_media==CONSTRUTOR_SIM);
      m_tab4_calc_maxmin_check.IsPressed(settings.take_calculo_maxmin==CONSTRUTOR_SIM);
      m_tab4_calc_maxmin_base_combo.SelectItem(ClampInt((int)settings.take_calculo_maxmin_base,0,3));
      m_tab4_calc_maxmin_count_spin.SetValue(IntegerToString(settings.take_calculo_maxmin_ultimos>0 ? settings.take_calculo_maxmin_ultimos : 3));
      m_tab4_calc_ref_base_combo.SelectItem(ClampInt((int)settings.take_calculo_referencia_base,0,3));
      m_tab4_calc_ref_candle_combo.SelectItem(ClampInt((int)settings.take_calculo_referencia_posicao,0,3));
      m_tab4_calc_ref_distance_spin.SetValue(DoubleToString(settings.take_calculo_referencia_distancia,1));
      m_tab4_calc_ref_expire_combo.SelectItem(ClampInt(settings.take_calculo_referencia_expirar,0,4));
      m_tab4_calc_media_candles_spin.SetValue(IntegerToString(settings.take_calculo_media_qtd_candles));
      m_tab4_calc_media_base_combo.SelectItem(ClampInt((int)settings.take_calculo_media_base,0,3));
      m_tab4_calc_media_distance_spin.SetValue(DoubleToString(settings.take_calculo_media_distancia,1));
      m_tab4_calc_media_expire_combo.SelectItem(ClampInt(settings.take_calculo_media_expirar,0,4));
      m_tab4_mult_base_combo.SelectItem(ClampInt((int)settings.take_calculo_multiplicar_base,0,1));
      m_tab4_mult_candle_combo.SelectItem(ClampInt(settings.take_calculo_multiplicar_candle,0,3));
      m_tab4_mult_qty_spin.SetValue(DoubleToString(settings.take_calculo_multiplicar_qtd,2));
      m_tab4_indic_trigger_spin.SetValue(DoubleToString(settings.take_indicador_distancia_disparo,1));
      m_tab4_indic_combo.SelectItem(settings.take_indicador_tipo==CONSTRUTOR_STOP_IND_PARABOLIC_SAR ? 1 : 0);

      }

   void StoreControlsToSettings(SConstrutorSettings &settings)
     {
      settings.estrategia_nome=m_tab1_name.GetValue();
      settings.mercado=(ENUM_CONSTRUTOR_MERCADO)m_tab1_market.GetListViewPointer().SelectedItemIndex();
      settings.tipo_operacional=(ENUM_CONSTRUTOR_TIPO_OPERACIONAL)m_tab1_oper.GetListViewPointer().SelectedItemIndex();
      settings.modo_processamento=(ENUM_CONSTRUTOR_MODO_PROCESSAMENTO)m_tab1_mode.GetListViewPointer().SelectedItemIndex();

      const int buy_idx=m_tab1_buy.GetListViewPointer().SelectedItemIndex();
      const int sell_idx=m_tab1_sell.GetListViewPointer().SelectedItemIndex();
      settings.operar_compra=(buy_idx==0 ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.operar_venda=(sell_idx==0 ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);

      settings.inicio_hora=m_tab1_start_hour_combo.GetListViewPointer().SelectedItemIndex();
      settings.inicio_minuto=m_tab1_start_min_combo.GetListViewPointer().SelectedItemIndex();
      settings.fim_hora=m_tab1_end_hour_combo.GetListViewPointer().SelectedItemIndex();
      settings.fim_minuto=m_tab1_end_min_combo.GetListViewPointer().SelectedItemIndex();

      settings.zerar_posicoes=(ENUM_CONSTRUTOR_SIM_NAO)m_tab1_zero_combo.GetListViewPointer().SelectedItemIndex();
      const int zh=m_tab1_zero_hour_combo.GetListViewPointer().SelectedItemIndex();
      const int zm=m_tab1_zero_min_combo.GetListViewPointer().SelectedItemIndex();
      settings.horario_zeragem=StringFormat("%02d:%02d",zh,zm);

      settings.tempo_grafico=(ENUM_CONSTRUTOR_TEMPO_GRAFICO)m_tab1_tempo_combo.GetListViewPointer().SelectedItemIndex();
      settings.volume_inicial=StringToDouble(m_tab1_volume_edit.GetValue());
      settings.spread_maximo=(int)StringToInteger(m_tab1_spread_edit.GetValue());

      // Tab 2 (Stop loss)
      const bool use_calc=m_tab2_use_calc.IsPressed();
      const bool use_mult=(!use_calc && m_tab2_use_mult.IsPressed());
      const bool use_fixed=(!use_calc && !use_mult && m_tab2_use_fixed.IsPressed());
      settings.stop_calculo=(use_calc ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.stop_calculo_multiplicar=(use_mult ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.stop_fixo=(use_fixed ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.tipo_stop_loss=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)m_tab2_calc_type.GetListViewPointer().SelectedItemIndex();
      settings.stop_fixo_distancia=StringToDouble(m_tab2_dist_spin.GetValue());
      settings.stop_calculo_referencia=(m_tab2_calc_ref_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.stop_calculo_media=(m_tab2_calc_media_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.stop_calculo_maxmin=(m_tab2_calc_maxmin_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.stop_calculo_maxmin_base=(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab2_calc_maxmin_base_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_calculo_maxmin_ultimos=(int)StringToInteger(m_tab2_calc_maxmin_count_spin.GetValue());
      settings.stop_calculo_referencia_base=(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab2_calc_ref_base_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_calculo_referencia_posicao=(ENUM_CONSTRUTOR_POSICAO_REFERENCIA)m_tab2_calc_ref_candle_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_calculo_media_qtd_candles=(int)StringToInteger(m_tab2_calc_media_candles_spin.GetValue());
      settings.stop_calculo_media_base=(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab2_calc_media_base_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_calculo_referencia_distancia=StringToDouble(m_tab2_calc_ref_distance_spin.GetValue());
      settings.stop_calculo_referencia_expirar=m_tab2_calc_ref_expire_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_calculo_media_distancia=StringToDouble(m_tab2_calc_media_distance_spin.GetValue());
      settings.stop_calculo_media_expirar=m_tab2_calc_media_expire_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_calculo_multiplicar_base=(ENUM_CONSTRUTOR_BASE_MULTIPLICAR)m_tab2_mult_base_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_calculo_multiplicar_candle=m_tab2_mult_candle_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_calculo_multiplicar_qtd=StringToDouble(m_tab2_mult_qty_spin.GetValue());

      // Tab 3 (Stop movel)
      settings.tipo_stop_movel=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)m_tab3_calc_type.GetListViewPointer().SelectedItemIndex();
      const bool use_padrao=m_tab3_use_padrao.IsPressed();
      const bool use_candles=(!use_padrao && m_tab3_use_candles.IsPressed());
      const bool use_indicador=(!use_padrao && !use_candles && m_tab3_use_indicador.IsPressed());
      settings.stop_movel=((use_padrao || use_candles || use_indicador) ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      if(use_padrao)
         settings.stop_movel_modo=CONSTRUTOR_STOP_MOVEL_PADRAO;
      else if(use_candles)
         settings.stop_movel_modo=CONSTRUTOR_STOP_MOVEL_CANDLES;
      else if(use_indicador)
         settings.stop_movel_modo=CONSTRUTOR_STOP_MOVEL_INDICADOR;
      if(use_candles)
         settings.stop_movel_candles_modo=CONSTRUTOR_STOP_MOVEL_CANDLES_DISTANCIA;
      settings.stop_movel_padrao_adicionar_favor=(int)StringToInteger(m_tab3_dist_spin.GetValue());
      settings.stop_movel_padrao_passo=(int)StringToInteger(m_tab3_passo_spin.GetValue());
      settings.stop_movel_candles_disparo_distancia=StringToDouble(m_tab3_candles_trigger_spin.GetValue());
      settings.stop_movel_candles_posicao=(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab3_candles_pos_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_movel_candles_candle_posicao=(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab3_candles_candle_combo.GetListViewPointer().SelectedItemIndex();
      settings.stop_movel_candles_distancia=StringToDouble(m_tab3_candles_refdist_spin.GetValue());
      settings.stop_movel_indicador_disparo_distancia=StringToDouble(m_tab3_indic_trigger_spin.GetValue());
      settings.stop_movel_indicador=(m_tab3_indic_combo.GetListViewPointer().SelectedItemIndex()==1 ? CONSTRUTOR_STOP_IND_PARABOLIC_SAR : CONSTRUTOR_STOP_IND_MEDIA_MOVEL);

      // Tab 4 (Take profit)
      settings.tipo_take_profit=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)m_tab4_calc_type.GetListViewPointer().SelectedItemIndex();
      const bool use_indic_tp=m_tab4_use_indicador.IsPressed();
      const bool use_mult_tp=m_tab4_use_mult.IsPressed();
      const bool use_calc_tp=(!use_indic_tp && !use_mult_tp && m_tab4_use_calc.IsPressed());
      const bool use_fixed_tp=(!use_indic_tp && !use_mult_tp && !use_calc_tp && m_tab4_use_fixed.IsPressed());
      settings.take_fixo=(use_fixed_tp ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.take_calculo=((use_calc_tp || use_mult_tp) ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.take_calculo_multiplicar=(use_mult_tp ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.take_indicador=(use_indic_tp ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.take_fixo_distancia=StringToDouble(m_tab4_dist_spin.GetValue());
      settings.take_calculo_referencia=(m_tab4_calc_ref_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.take_calculo_media=(m_tab4_calc_media_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.take_calculo_maxmin=(m_tab4_calc_maxmin_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      settings.take_calculo_maxmin_base=(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab4_calc_maxmin_base_combo.GetListViewPointer().SelectedItemIndex();
      settings.take_calculo_maxmin_ultimos=(int)StringToInteger(m_tab4_calc_maxmin_count_spin.GetValue());
      settings.take_calculo_referencia_base=(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab4_calc_ref_base_combo.GetListViewPointer().SelectedItemIndex();
      settings.take_calculo_referencia_posicao=(ENUM_CONSTRUTOR_POSICAO_REFERENCIA)m_tab4_calc_ref_candle_combo.GetListViewPointer().SelectedItemIndex();
      settings.take_calculo_media_qtd_candles=(int)StringToInteger(m_tab4_calc_media_candles_spin.GetValue());
      settings.take_calculo_media_base=(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab4_calc_media_base_combo.GetListViewPointer().SelectedItemIndex();
      settings.take_calculo_referencia_distancia=StringToDouble(m_tab4_calc_ref_distance_spin.GetValue());
      settings.take_calculo_referencia_expirar=m_tab4_calc_ref_expire_combo.GetListViewPointer().SelectedItemIndex();
      settings.take_calculo_media_distancia=StringToDouble(m_tab4_calc_media_distance_spin.GetValue());
      settings.take_calculo_media_expirar=m_tab4_calc_media_expire_combo.GetListViewPointer().SelectedItemIndex();
      settings.take_calculo_multiplicar_base=(ENUM_CONSTRUTOR_BASE_MULTIPLICAR)m_tab4_mult_base_combo.GetListViewPointer().SelectedItemIndex();
      settings.take_calculo_multiplicar_candle=m_tab4_mult_candle_combo.GetListViewPointer().SelectedItemIndex();
      settings.take_calculo_multiplicar_qtd=StringToDouble(m_tab4_mult_qty_spin.GetValue());
      settings.take_indicador_distancia_disparo=StringToDouble(m_tab4_indic_trigger_spin.GetValue());
      settings.take_indicador_tipo=(m_tab4_indic_combo.GetListViewPointer().SelectedItemIndex()==1 ? CONSTRUTOR_STOP_IND_PARABOLIC_SAR : CONSTRUTOR_STOP_IND_MEDIA_MOVEL);

      }

public:
                     CConstrutorEasyPanel(void) : m_created(false), m_visible(false), m_window_index(-1), m_top_tab_last(-1), m_signal_is_buy(true) {}

   bool              IsVisible(void) const { return(m_visible); }
   bool              IsCreated(void) const { return(m_created); }

   bool CreateIfNeeded(void)
     {
      if(m_created)
         return(true);

	      const int window_x=260;
	      const int window_y=40;
	      const int window_w=1400;
	      const int window_h=860;

      if(!CreateWindow(m_window,"Construtor | EasyAndFastGUI",window_x,window_y,window_w,window_h,true,true,true,true))
         return(false);

      m_window_index=WindowsTotal()-1;
      m_window.BackColor(C'247,241,231');

      if(!CreateTextLabel(m_title,"Construtor (Easy GUI) | EasyPanel.mqh",m_window,m_window_index,16,40,520,22))
         return(false);
      m_title.FontSize(12);
      if(!CreateTextLabel(m_note,"Use as abas laterais para navegar (placeholder).",m_window,m_window_index,16,66,780,20))
         return(false);
      m_note.LabelColor(C'91,78,64');

	      // Top tabs (upper)
	      const int padding=16;
	      const int top_tabs_top=98;
	      const int top_tab_h=30;
	      const int top_tabs_x=padding;
	      const int top_tabs_y=top_tabs_top + top_tab_h; // canvas starts below buttons (buttons render above)
	      const int top_tabs_w=window_w - (padding*2);
	      const int top_tabs_h=window_h - top_tabs_y - padding;

	      string top_text[];
	      int top_widths[];
	      ArrayResize(top_text,TOP_TAB_COUNT);
	      ArrayResize(top_widths,TOP_TAB_COUNT);
	      top_text[0]="Parametrizacao e montagem";
	      top_text[1]="Execucao e painel";
	      top_widths[0]=320;
	      top_widths[1]=240;

	      m_top_tabs.MainPointer(m_window);
	      m_top_tabs.XSize(top_tabs_w);
	      m_top_tabs.YSize(top_tabs_h);
	      m_top_tabs.IsCenterText(true);
	      m_top_tabs.PositionMode(TABS_TOP);
	      m_top_tabs.TabsYSize(top_tab_h);
	      m_top_tabs.AutoXResizeMode(true);
	      m_top_tabs.AutoYResizeMode(true);
	      m_top_tabs.AutoXResizeRightOffset(padding);
	      m_top_tabs.AutoYResizeBottomOffset(padding);
	      // Main area background
	      m_top_tabs.BackColorPressed(C'247,241,231');
	      m_top_tabs.BorderColor(C'220,207,186');
	      m_top_tabs.BorderColorHover(C'220,207,186');
	      m_top_tabs.BorderColorPressed(C'220,207,186');

	      for(int i=0; i<TOP_TAB_COUNT; i++)
	         m_top_tabs.AddTab(top_text[i],top_widths[i]);

	      if(!m_top_tabs.CreateTabs(top_tabs_x,top_tabs_y))
	         return(false);
	      AddToElementsArray(m_window_index,m_top_tabs);

	      CEF_CButtonsGroup *tbg=m_top_tabs.GetButtonsGroupPointer();
	      if(tbg!=NULL)
	        {
	         for(int i=0; i<TOP_TAB_COUNT; i++)
	           {
	            tbg.GetButtonPointer(i).FontSize(10);
	            tbg.GetButtonPointer(i).LabelXGap(0);
	            tbg.GetButtonPointer(i).LabelYGap(0);
	            // Match sidebar palette (navy + orange)
	            tbg.GetButtonPointer(i).BackColor(C'39,54,78');
	            tbg.GetButtonPointer(i).BackColorHover(C'62,79,101');
	            tbg.GetButtonPointer(i).BackColorPressed(C'226,114,64');
	            tbg.GetButtonPointer(i).BorderColor(C'18,29,43');
	            tbg.GetButtonPointer(i).BorderColorHover(C'62,79,101');
	            tbg.GetButtonPointer(i).BorderColorPressed(C'240,140,86');
	            tbg.GetButtonPointer(i).LabelColor(clrWhite);
	            tbg.GetButtonPointer(i).LabelColorHover(clrWhite);
	            tbg.GetButtonPointer(i).LabelColorPressed(clrWhite);
	           }
	        }

	      // Placeholder for top tab 2
	      if(!CreateTextLabel(m_top_placeholder,"Conteudo: Execucao e painel (em migracao)",m_top_tabs,m_window_index,m_top_tabs,1,16,16,top_tabs_w-32,22))
	         return(false);
	      m_top_placeholder.FontSize(11);
	      m_top_placeholder.LabelColor(C'91,78,64');

	            string tab_text[];
      int tab_widths[];
      ArrayResize(tab_text,EASY_TAB_COUNT);
      ArrayResize(tab_widths,EASY_TAB_COUNT);

      tab_text[0]="1. Inf. Iniciais";
      tab_text[1]="2. Stop loss";
      tab_text[2]="3. Stop movel";
      tab_text[3]="4. Take profit";
      tab_text[4]="5. Break even";
      tab_text[5]="6. Trailing stop";
      tab_text[6]="7. Saídas parciais";
      tab_text[7]="8. Sinais";
      tab_text[8]="9. Ajustes finais";
      tab_text[9]="10. Painel";

      const int tab_w=240;
      const int tab_h=30;

	      const int inner_pad=16;
	      const int action_h=48;
	      const int tabs_x=inner_pad + tab_w; // leave room for left tabs (they render at negative X)
	      const int tabs_y=inner_pad;
	      const int tabs_w=top_tabs_w - tab_w - (inner_pad*2);
	      const int tabs_h=top_tabs_h - (inner_pad*2) - action_h;

      m_tabs.MainPointer(m_top_tabs);
      m_tabs.XSize(tabs_w);
      m_tabs.YSize(tabs_h);
      m_tabs.IsCenterText(true);
      m_tabs.PositionMode(TABS_LEFT);
      m_tabs.TabsYSize(tab_h);
	      m_tabs.AutoXResizeMode(true);
	      m_tabs.AutoYResizeMode(true);
	      m_tabs.AutoXResizeRightOffset(inner_pad);
	      m_tabs.AutoYResizeBottomOffset(inner_pad + action_h);
      // Main content area background
      m_tabs.BackColorPressed(C'247,241,231');
      m_tabs.BorderColor(C'220,207,186');
      m_tabs.BorderColorHover(C'220,207,186');
      m_tabs.BorderColorPressed(C'220,207,186');

	      for(int i=0; i<EASY_TAB_COUNT; i++)
	        {
	         tab_widths[i]=tab_w;
	         m_tabs.AddTab(tab_text[i],tab_widths[i]);
	        }

      if(!m_tabs.CreateTabs(tabs_x,tabs_y))
         return(false);
      AddToElementsArray(m_window_index,m_tabs);
      m_top_tabs.AddToElementsArray(0,m_tabs);

	      // Bottom-right action (always visible regardless of lateral tab)
	      const int btn_w=140;
	      const int btn_h=28;
	      const int btn_x_gap=inner_pad + btn_w;  // anchored from right edge
	      const int btn_y_gap=inner_pad + btn_h;  // anchored from bottom edge
	      m_btn_refresh.MainPointer(m_top_tabs);
	      m_top_tabs.AddToElementsArray(0,m_btn_refresh);
	      m_btn_refresh.NamePart("easy_refresh");
	      m_btn_refresh.XSize(btn_w);
	      m_btn_refresh.YSize(btn_h);
	      m_btn_refresh.IsCenterText(true);
	      m_btn_refresh.FontSize(10);
	      m_btn_refresh.AnchorRightWindowSide(true);
	      m_btn_refresh.AnchorBottomWindowSide(true);
	      m_btn_refresh.BackColor(C'226,114,64');
	      m_btn_refresh.BackColorHover(C'240,140,86');
	      m_btn_refresh.BackColorPressed(C'200,95,52');
	      m_btn_refresh.BorderColor(C'240,140,86');
	      m_btn_refresh.BorderColorHover(C'240,140,86');
	      m_btn_refresh.BorderColorPressed(C'240,140,86');
	      m_btn_refresh.LabelColor(clrWhite);
	      m_btn_refresh.LabelColorHover(clrWhite);
	      m_btn_refresh.LabelColorPressed(clrWhite);
	      if(!m_btn_refresh.CreateButton("Aplicar",btn_x_gap,btn_y_gap))
	         return(false);
	      AddToElementsArray(m_window_index,m_btn_refresh);

      CEF_CButtonsGroup *bg=m_tabs.GetButtonsGroupPointer();
      if(bg!=NULL)
        {
	         for(int i=0; i<EASY_TAB_COUNT; i++)
	           {
	            bg.GetButtonPointer(i).FontSize(10);
	            bg.GetButtonPointer(i).LabelXGap(0);
	            bg.GetButtonPointer(i).LabelYGap(0);
            // Sidebar-like colors (buttons only)
            bg.GetButtonPointer(i).BackColor(C'39,54,78');
            bg.GetButtonPointer(i).BackColorHover(C'62,79,101');
            bg.GetButtonPointer(i).BackColorPressed(C'226,114,64');
            bg.GetButtonPointer(i).BorderColor(C'18,29,43');
            bg.GetButtonPointer(i).BorderColorHover(C'62,79,101');
            bg.GetButtonPointer(i).BorderColorPressed(C'240,140,86');
            bg.GetButtonPointer(i).LabelColor(clrWhite);
            bg.GetButtonPointer(i).LabelColorHover(clrWhite);
            bg.GetButtonPointer(i).LabelColorPressed(clrWhite);
           }
        }

		      // Tab headers (title + note) like CPanel
		      const int header_x=24;
		      const int header_y=10;
		      const int header_w=tabs_w - (header_x*2);
		      const int header_title_h=28;
		      const int header_note_h=18;
		      const int header_gap=4;

		      	      string tab_titles[];
	      string tab_notes[];
	      ArrayResize(tab_titles,EASY_TAB_COUNT);
	      ArrayResize(tab_notes,EASY_TAB_COUNT);
	      tab_titles[0]="1. Inf. Iniciais";
	      tab_titles[1]="2. Stop loss";
	      tab_titles[2]="3. Stop movel";
	      tab_titles[3]="4. Take profit";
	      tab_titles[4]="5. Break even";
	      tab_titles[5]="6. Trailing stop";
	      tab_titles[6]="7. Saídas parciais";
	      tab_titles[7]="8. Sinais";
	      tab_titles[8]="9. Ajustes finais";
	      tab_titles[9]="10. Painel";

	      tab_notes[0]="Base inicial do projeto e configuração principal.";
	      tab_notes[1]="Stop loss fixo, cálculo e proteção por perda.";
	      tab_notes[2]="Regras para mover o stop automaticamente.";
	      tab_notes[3]="Take profit fixo, cálculo e projeção de lucro.";
	      tab_notes[4]="Break even e proteção sem prejuízo.";
	      tab_notes[5]="Trailing stop e acompanhamento dinâmico.";
	      tab_notes[6]="Saídas fracionadas e gerenciamento parcial.";
	      tab_notes[7]="Gatilhos e filtros de sinal.";
	      tab_notes[8]="Acabamento final da estratégia.";
	      tab_notes[9]="Painel geral da interface.";

      for(int i=0; i<EASY_TAB_COUNT; i++)
		        {
		         if(!CreateTextLabel(m_tab_headers_title[i],tab_titles[i],m_tabs,m_window_index,m_tabs,i,header_x,header_y,header_w,header_title_h))
		            return(false);
		         m_tab_headers_title[i].FontSize(18);
		         m_tab_headers_title[i].LabelColor(C'43,43,43');

		         if(!CreateTextLabel(m_tab_headers_note[i],tab_notes[i],m_tabs,m_window_index,m_tabs,i,header_x,header_y+header_title_h+header_gap,header_w,header_note_h))
		            return(false);
		         m_tab_headers_note[i].FontSize(10);
		         m_tab_headers_note[i].LabelColor(C'91,78,64');
		        }

		      // Tab 1 styled preview (replace placeholder)
		      const int content_pad=24;
		      const int content_y=header_y + header_title_h + header_gap + header_note_h + 18;
		      const int content_w=tabs_w - (content_pad*2);
		      const int card_gap=12;
		      const int card_w=(content_w - (card_gap*3)) / 4;
		      const int card_h=420;

		      // Frames with empty title (we draw our own title inside to avoid overlap with the frame border)
		      if(!CreateFrame(m_tab1_card_left,"",m_tabs,m_window_index,m_tabs,0,content_pad,content_y,card_w,card_h,1))
		         return(false);
		      m_tab1_card_left.BackColor(C'233,220,203');
		      m_tab1_card_left.BorderColor(C'197,168,136');

	      if(!CreateFrame(m_tab1_card_right,"",m_tabs,m_window_index,m_tabs,0,content_pad+card_w+card_gap,content_y,card_w,card_h,1))
	         return(false);
	      m_tab1_card_right.BackColor(C'233,220,203');
	      m_tab1_card_right.BorderColor(C'197,168,136');

		      if(!CreateFrame(m_tab1_card_schedule,"",m_tabs,m_window_index,m_tabs,0,content_pad+(card_w+card_gap)*2,content_y,card_w,card_h,1))
		         return(false);
		      m_tab1_card_schedule.BackColor(C'233,220,203');
		      m_tab1_card_schedule.BorderColor(C'197,168,136');

		      if(!CreateFrame(m_tab1_card_config,"",m_tabs,m_window_index,m_tabs,0,content_pad+(card_w+card_gap)*3,content_y,card_w,card_h,1))
		         return(false);
		      m_tab1_card_config.BackColor(C'233,220,203');
		      m_tab1_card_config.BorderColor(C'197,168,136');

	      if(!CreateTextLabel(m_tab1_card_left_title,"Informacoes basicas",m_tab1_card_left,m_window_index,m_tabs,0,16,12,card_w-32,22))
	         return(false);
	      m_tab1_card_left_title.FontSize(12);
	      m_tab1_card_left_title.LabelColor(C'43,43,43');

		      if(!CreateTextLabel(m_tab1_card_right_title,"Direcao operacional",m_tab1_card_right,m_window_index,m_tabs,0,16,12,card_w-32,22))
		         return(false);
		      m_tab1_card_right_title.FontSize(12);
		      m_tab1_card_right_title.LabelColor(C'43,43,43');

		      if(!CreateTextLabel(m_tab1_card_schedule_title,"Horario e zeragem",m_tab1_card_schedule,m_window_index,m_tabs,0,16,12,card_w-32,22))
		         return(false);
		      m_tab1_card_schedule_title.FontSize(12);
		      m_tab1_card_schedule_title.LabelColor(C'43,43,43');

		      if(!CreateTextLabel(m_tab1_card_config_title,"Configuracao inicial",m_tab1_card_config,m_window_index,m_tabs,0,16,12,card_w-32,22))
		         return(false);
		      m_tab1_card_config_title.FontSize(12);
		      m_tab1_card_config_title.LabelColor(C'43,43,43');

      string items_yesno[];
      ArrayResize(items_yesno,2);
      items_yesno[0]="Sim";
      items_yesno[1]="Nao";

      string items_market[];
      ArrayResize(items_market,2);
      items_market[0]="B3";
      items_market[1]="Forex";

      string items_oper[];
      ArrayResize(items_oper,2);
      items_oper[0]="Day trade";
      items_oper[1]="Swing trade";

	      string items_mode[];
	      ArrayResize(items_mode,2);
	      items_mode[0]="Cada tick";
	      items_mode[1]="Cada segundo";

	      string items_tf[];
	      ArrayResize(items_tf,21);
	      items_tf[0]="Corrente";
	      items_tf[1]="M1";
	      items_tf[2]="M2";
	      items_tf[3]="M3";
	      items_tf[4]="M4";
	      items_tf[5]="M5";
	      items_tf[6]="M6";
	      items_tf[7]="M10";
	      items_tf[8]="M12";
	      items_tf[9]="M15";
	      items_tf[10]="M30";
	      items_tf[11]="H1";
	      items_tf[12]="H2";
	      items_tf[13]="H3";
	      items_tf[14]="H4";
	      items_tf[15]="H6";
	      items_tf[16]="H8";
	      items_tf[17]="H12";
	      items_tf[18]="D1";
	      items_tf[19]="W1";
	      items_tf[20]="MN1";

	      string items_hour[];
	      ArrayResize(items_hour,24);
	      for(int i=0;i<24;i++)
	         items_hour[i]=StringFormat("%02d",i);

	      string items_min[];
	      ArrayResize(items_min,60);
	      for(int i=0;i<60;i++)
	         items_min[i]=StringFormat("%02d",i);

      // Controls layout (label above control)
      const int field_x=16;
      const int field_w=card_w-32;
      const int edit_w=field_w;
      const int label_h=18;
      const int control_h=20;
      const int v_gap=10;
      const int control_btn_w=field_w-2; // full-width combo button (with 1px padding)
      const int control_btn_x=1;
      const int list_h=200;
      const int start_y=44;

      int y=start_y;
      if(!CreateTextLabel(m_tab1_name_label,"Nome da estrategia",m_tab1_card_left,m_window_index,m_tabs,0,field_x,y,field_w,label_h))
         return(false);
      m_tab1_name_label.LabelColor(C'91,78,64');
      y+=label_h+4;
      if(!CreateTextEdit(m_tab1_name,"",m_tab1_card_left,m_window_index,m_tabs,0,false,field_x,y,field_w,edit_w,"","Minha estrategia"))
         return(false);
      y+=control_h+v_gap;

      if(!CreateTextLabel(m_tab1_market_label,"Mercado desejado",m_tab1_card_left,m_window_index,m_tabs,0,field_x,y,field_w,label_h))
         return(false);
      m_tab1_market_label.LabelColor(C'91,78,64');
      y+=label_h+4;
      // Combobox bigger than default
      const color field_border=C'91,78,64';
      m_tab1_market.MainPointer(m_tab1_card_left);
      m_tabs.AddToElementsArray(0,m_tab1_market);
      m_tab1_market.XSize(field_w);
      m_tab1_market.YSize(control_h);
      m_tab1_market.BackColor(clrWhite);
      m_tab1_market.BackColorHover(clrWhite);
      m_tab1_market.BackColorPressed(clrWhite);
      m_tab1_market.BorderColor(field_border);
      m_tab1_market.BorderColorHover(field_border);
      m_tab1_market.BorderColorPressed(field_border);
      m_tab1_market.FontSize(10);
      m_tab1_market.ItemsTotal(ArraySize(items_market));
      m_tab1_market.CheckBoxMode(false);
      m_tab1_market.GetButtonPointer().XSize(control_btn_w);
      m_tab1_market.GetButtonPointer().XGap(control_btn_x);
      m_tab1_market.GetButtonPointer().YSize(control_h);
      m_tab1_market.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab1_market.GetButtonPointer().BackColor(clrWhite);
      m_tab1_market.GetButtonPointer().BackColorHover(clrWhite);
      m_tab1_market.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab1_market.GetButtonPointer().BorderColor(field_border);
      m_tab1_market.GetButtonPointer().BorderColorHover(field_border);
      m_tab1_market.GetButtonPointer().BorderColorPressed(field_border);
      m_tab1_market.GetButtonPointer().IconXGap(control_btn_w-18);
      m_tab1_market.GetButtonPointer().LabelXGap(10);
      m_tab1_market.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_market);i++) m_tab1_market.SetValue(i,items_market[i]);
      m_tab1_market.GetListViewPointer().YSize(list_h);
      m_tab1_market.GetListViewPointer().LightsHover(true);
      m_tab1_market.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab1_market.CreateComboBox("",field_x,y))
         return(false);
      AddToElementsArray(m_window_index,m_tab1_market);
      m_tab1_market.SelectItem(0);
      y+=control_h+v_gap;

      if(!CreateTextLabel(m_tab1_oper_label,"Tipo operacional",m_tab1_card_left,m_window_index,m_tabs,0,field_x,y,field_w,label_h))
         return(false);
      m_tab1_oper_label.LabelColor(C'91,78,64');
      y+=label_h+4;
      m_tab1_oper.MainPointer(m_tab1_card_left);
      m_tabs.AddToElementsArray(0,m_tab1_oper);
      m_tab1_oper.XSize(field_w);
      m_tab1_oper.YSize(control_h);
      m_tab1_oper.BackColor(clrWhite);
      m_tab1_oper.BackColorHover(clrWhite);
      m_tab1_oper.BackColorPressed(clrWhite);
      m_tab1_oper.BorderColor(field_border);
      m_tab1_oper.BorderColorHover(field_border);
      m_tab1_oper.BorderColorPressed(field_border);
      m_tab1_oper.FontSize(10);
      m_tab1_oper.ItemsTotal(ArraySize(items_oper));
      m_tab1_oper.CheckBoxMode(false);
      m_tab1_oper.GetButtonPointer().XSize(control_btn_w);
      m_tab1_oper.GetButtonPointer().XGap(control_btn_x);
      m_tab1_oper.GetButtonPointer().YSize(control_h);
      m_tab1_oper.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab1_oper.GetButtonPointer().BackColor(clrWhite);
      m_tab1_oper.GetButtonPointer().BackColorHover(clrWhite);
      m_tab1_oper.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab1_oper.GetButtonPointer().BorderColor(field_border);
      m_tab1_oper.GetButtonPointer().BorderColorHover(field_border);
      m_tab1_oper.GetButtonPointer().BorderColorPressed(field_border);
      m_tab1_oper.GetButtonPointer().IconXGap(control_btn_w-18);
      m_tab1_oper.GetButtonPointer().LabelXGap(10);
      m_tab1_oper.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_oper);i++) m_tab1_oper.SetValue(i,items_oper[i]);
      m_tab1_oper.GetListViewPointer().YSize(list_h);
      m_tab1_oper.GetListViewPointer().LightsHover(true);
      m_tab1_oper.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab1_oper.CreateComboBox("",field_x,y))
         return(false);
      AddToElementsArray(m_window_index,m_tab1_oper);
      m_tab1_oper.SelectItem(0);
      y+=control_h+v_gap;

      if(!CreateTextLabel(m_tab1_mode_label,"Modo de processamento",m_tab1_card_left,m_window_index,m_tabs,0,field_x,y,field_w,label_h))
         return(false);
      m_tab1_mode_label.LabelColor(C'91,78,64');
      y+=label_h+4;
      m_tab1_mode.MainPointer(m_tab1_card_left);
      m_tabs.AddToElementsArray(0,m_tab1_mode);
      m_tab1_mode.XSize(field_w);
      m_tab1_mode.YSize(control_h);
      m_tab1_mode.BackColor(clrWhite);
      m_tab1_mode.BackColorHover(clrWhite);
      m_tab1_mode.BackColorPressed(clrWhite);
      m_tab1_mode.BorderColor(field_border);
      m_tab1_mode.BorderColorHover(field_border);
      m_tab1_mode.BorderColorPressed(field_border);
      m_tab1_mode.FontSize(10);
      m_tab1_mode.ItemsTotal(ArraySize(items_mode));
      m_tab1_mode.CheckBoxMode(false);
      m_tab1_mode.GetButtonPointer().XSize(control_btn_w);
      m_tab1_mode.GetButtonPointer().XGap(control_btn_x);
      m_tab1_mode.GetButtonPointer().YSize(control_h);
      m_tab1_mode.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab1_mode.GetButtonPointer().BackColor(clrWhite);
      m_tab1_mode.GetButtonPointer().BackColorHover(clrWhite);
      m_tab1_mode.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab1_mode.GetButtonPointer().BorderColor(field_border);
      m_tab1_mode.GetButtonPointer().BorderColorHover(field_border);
      m_tab1_mode.GetButtonPointer().BorderColorPressed(field_border);
      m_tab1_mode.GetButtonPointer().IconXGap(control_btn_w-18);
      m_tab1_mode.GetButtonPointer().LabelXGap(10);
      m_tab1_mode.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_mode);i++) m_tab1_mode.SetValue(i,items_mode[i]);
      m_tab1_mode.GetListViewPointer().YSize(list_h);
      m_tab1_mode.GetListViewPointer().LightsHover(true);
      m_tab1_mode.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab1_mode.CreateComboBox("",field_x,y))
         return(false);
      AddToElementsArray(m_window_index,m_tab1_mode);
      m_tab1_mode.SelectItem(0);

      // Right card (buy/sell)
      y=start_y;
      if(!CreateTextLabel(m_tab1_buy_label,"Operar na compra",m_tab1_card_right,m_window_index,m_tabs,0,field_x,y,field_w,label_h))
         return(false);
      m_tab1_buy_label.LabelColor(C'91,78,64');
      y+=label_h+4;
      m_tab1_buy.MainPointer(m_tab1_card_right);
      m_tabs.AddToElementsArray(0,m_tab1_buy);
      m_tab1_buy.XSize(field_w);
      m_tab1_buy.YSize(control_h);
      m_tab1_buy.BackColor(clrWhite);
      m_tab1_buy.BackColorHover(clrWhite);
      m_tab1_buy.BackColorPressed(clrWhite);
      m_tab1_buy.BorderColor(field_border);
      m_tab1_buy.BorderColorHover(field_border);
      m_tab1_buy.BorderColorPressed(field_border);
      m_tab1_buy.FontSize(10);
      m_tab1_buy.ItemsTotal(ArraySize(items_yesno));
      m_tab1_buy.CheckBoxMode(false);
      m_tab1_buy.GetButtonPointer().XSize(control_btn_w);
      m_tab1_buy.GetButtonPointer().XGap(control_btn_x);
      m_tab1_buy.GetButtonPointer().YSize(control_h);
      m_tab1_buy.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab1_buy.GetButtonPointer().BackColor(clrWhite);
      m_tab1_buy.GetButtonPointer().BackColorHover(clrWhite);
      m_tab1_buy.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab1_buy.GetButtonPointer().BorderColor(field_border);
      m_tab1_buy.GetButtonPointer().BorderColorHover(field_border);
      m_tab1_buy.GetButtonPointer().BorderColorPressed(field_border);
      m_tab1_buy.GetButtonPointer().IconXGap(control_btn_w-18);
      m_tab1_buy.GetButtonPointer().LabelXGap(10);
      m_tab1_buy.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_yesno);i++) m_tab1_buy.SetValue(i,items_yesno[i]);
      m_tab1_buy.GetListViewPointer().YSize(120);
      m_tab1_buy.GetListViewPointer().LightsHover(true);
      m_tab1_buy.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab1_buy.CreateComboBox("",field_x,y))
         return(false);
      AddToElementsArray(m_window_index,m_tab1_buy);
      m_tab1_buy.SelectItem(0);

      y+=control_h+v_gap;
      if(!CreateTextLabel(m_tab1_sell_label,"Operar na venda",m_tab1_card_right,m_window_index,m_tabs,0,field_x,y,field_w,label_h))
         return(false);
      m_tab1_sell_label.LabelColor(C'91,78,64');
      y+=label_h+4;
      m_tab1_sell.MainPointer(m_tab1_card_right);
      m_tabs.AddToElementsArray(0,m_tab1_sell);
      m_tab1_sell.XSize(field_w);
      m_tab1_sell.YSize(control_h);
      m_tab1_sell.BackColor(clrWhite);
      m_tab1_sell.BackColorHover(clrWhite);
      m_tab1_sell.BackColorPressed(clrWhite);
      m_tab1_sell.BorderColor(field_border);
      m_tab1_sell.BorderColorHover(field_border);
      m_tab1_sell.BorderColorPressed(field_border);
      m_tab1_sell.FontSize(10);
      m_tab1_sell.ItemsTotal(ArraySize(items_yesno));
      m_tab1_sell.CheckBoxMode(false);
      m_tab1_sell.GetButtonPointer().XSize(control_btn_w);
      m_tab1_sell.GetButtonPointer().XGap(control_btn_x);
      m_tab1_sell.GetButtonPointer().YSize(control_h);
      m_tab1_sell.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab1_sell.GetButtonPointer().BackColor(clrWhite);
      m_tab1_sell.GetButtonPointer().BackColorHover(clrWhite);
      m_tab1_sell.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab1_sell.GetButtonPointer().BorderColor(field_border);
      m_tab1_sell.GetButtonPointer().BorderColorHover(field_border);
      m_tab1_sell.GetButtonPointer().BorderColorPressed(field_border);
      m_tab1_sell.GetButtonPointer().IconXGap(control_btn_w-18);
      m_tab1_sell.GetButtonPointer().LabelXGap(10);
      m_tab1_sell.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_yesno);i++) m_tab1_sell.SetValue(i,items_yesno[i]);
      m_tab1_sell.GetListViewPointer().YSize(120);
      m_tab1_sell.GetListViewPointer().LightsHover(true);
      m_tab1_sell.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_sell.CreateComboBox("",field_x,y))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_sell);
	      m_tab1_sell.SelectItem(0);

	      // Schedule/Zeragem card (merged content from original Tab 2)
	      const int sched_x=16;
	      const int sched_y=44;
	      const int sched_w=card_w-32;
	      const int time_gap=8;
	      const int time_w=(sched_w - time_gap) / 2;
	      const int hour_x=sched_x;
	      const int min_x=sched_x + time_w + time_gap;

	      int sy=sched_y;
	      if(!CreateTextLabel(m_tab1_start_label,"Inicio das operacoes",m_tab1_card_schedule,m_window_index,m_tabs,0,sched_x,sy,sched_w,18))
	         return(false);
	      m_tab1_start_label.LabelColor(C'91,78,64');
	      sy+=22;
	      if(!CreateTextLabel(m_tab1_start_hour_label,"Hora",m_tab1_card_schedule,m_window_index,m_tabs,0,hour_x,sy,time_w,14))
	         return(false);
	      m_tab1_start_hour_label.LabelColor(C'91,78,64');
	      if(!CreateTextLabel(m_tab1_start_min_label,"Min",m_tab1_card_schedule,m_window_index,m_tabs,0,min_x,sy,time_w,14))
	         return(false);
	      m_tab1_start_min_label.LabelColor(C'91,78,64');
	      sy+=16;

	      // Start hour combo
	      m_tab1_start_hour_combo.MainPointer(m_tab1_card_schedule);
	      m_tabs.AddToElementsArray(0,m_tab1_start_hour_combo);
	      m_tab1_start_hour_combo.XSize(time_w);
	      m_tab1_start_hour_combo.YSize(control_h);
	      m_tab1_start_hour_combo.BackColor(clrWhite);
	      m_tab1_start_hour_combo.BackColorHover(clrWhite);
	      m_tab1_start_hour_combo.BackColorPressed(clrWhite);
	      m_tab1_start_hour_combo.BorderColor(field_border);
	      m_tab1_start_hour_combo.BorderColorHover(field_border);
	      m_tab1_start_hour_combo.BorderColorPressed(field_border);
	      m_tab1_start_hour_combo.FontSize(10);
	      m_tab1_start_hour_combo.ItemsTotal(ArraySize(items_hour));
	      m_tab1_start_hour_combo.CheckBoxMode(false);
	      m_tab1_start_hour_combo.GetButtonPointer().XGap(1);
	      m_tab1_start_hour_combo.GetButtonPointer().XSize(time_w-2);
	      m_tab1_start_hour_combo.GetButtonPointer().YSize(control_h);
	      m_tab1_start_hour_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab1_start_hour_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab1_start_hour_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab1_start_hour_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_start_hour_combo.GetButtonPointer().BorderColor(field_border);
	      m_tab1_start_hour_combo.GetButtonPointer().BorderColorHover(field_border);
	      m_tab1_start_hour_combo.GetButtonPointer().BorderColorPressed(field_border);
	      m_tab1_start_hour_combo.GetButtonPointer().IconXGap((time_w-2)-18);
	      m_tab1_start_hour_combo.GetButtonPointer().LabelXGap(8);
	      m_tab1_start_hour_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_hour);i++) m_tab1_start_hour_combo.SetValue(i,items_hour[i]);
	      m_tab1_start_hour_combo.GetListViewPointer().YSize(160);
	      m_tab1_start_hour_combo.GetListViewPointer().LightsHover(true);
	      m_tab1_start_hour_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_start_hour_combo.CreateComboBox("",hour_x,sy))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_start_hour_combo);
	      m_tab1_start_hour_combo.SelectItem(9);

	      // Start min combo
	      m_tab1_start_min_combo.MainPointer(m_tab1_card_schedule);
	      m_tabs.AddToElementsArray(0,m_tab1_start_min_combo);
	      m_tab1_start_min_combo.XSize(time_w);
	      m_tab1_start_min_combo.YSize(control_h);
	      m_tab1_start_min_combo.BackColor(clrWhite);
	      m_tab1_start_min_combo.BackColorHover(clrWhite);
	      m_tab1_start_min_combo.BackColorPressed(clrWhite);
	      m_tab1_start_min_combo.BorderColor(field_border);
	      m_tab1_start_min_combo.BorderColorHover(field_border);
	      m_tab1_start_min_combo.BorderColorPressed(field_border);
	      m_tab1_start_min_combo.FontSize(10);
	      m_tab1_start_min_combo.ItemsTotal(ArraySize(items_min));
	      m_tab1_start_min_combo.CheckBoxMode(false);
	      m_tab1_start_min_combo.GetButtonPointer().XGap(1);
	      m_tab1_start_min_combo.GetButtonPointer().XSize(time_w-2);
	      m_tab1_start_min_combo.GetButtonPointer().YSize(control_h);
	      m_tab1_start_min_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab1_start_min_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab1_start_min_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab1_start_min_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_start_min_combo.GetButtonPointer().BorderColor(field_border);
	      m_tab1_start_min_combo.GetButtonPointer().BorderColorHover(field_border);
	      m_tab1_start_min_combo.GetButtonPointer().BorderColorPressed(field_border);
	      m_tab1_start_min_combo.GetButtonPointer().IconXGap((time_w-2)-18);
	      m_tab1_start_min_combo.GetButtonPointer().LabelXGap(8);
	      m_tab1_start_min_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_min);i++) m_tab1_start_min_combo.SetValue(i,items_min[i]);
	      m_tab1_start_min_combo.GetListViewPointer().YSize(160);
	      m_tab1_start_min_combo.GetListViewPointer().LightsHover(true);
	      m_tab1_start_min_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_start_min_combo.CreateComboBox("",min_x,sy))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_start_min_combo);
	      m_tab1_start_min_combo.SelectItem(0);

	      sy+=control_h+12;
	      if(!CreateTextLabel(m_tab1_end_label,"Fim das operacoes",m_tab1_card_schedule,m_window_index,m_tabs,0,sched_x,sy,sched_w,18))
	         return(false);
	      m_tab1_end_label.LabelColor(C'91,78,64');
	      sy+=22;
	      if(!CreateTextLabel(m_tab1_end_hour_label,"Hora",m_tab1_card_schedule,m_window_index,m_tabs,0,hour_x,sy,time_w,14))
	         return(false);
	      m_tab1_end_hour_label.LabelColor(C'91,78,64');
	      if(!CreateTextLabel(m_tab1_end_min_label,"Min",m_tab1_card_schedule,m_window_index,m_tabs,0,min_x,sy,time_w,14))
	         return(false);
	      m_tab1_end_min_label.LabelColor(C'91,78,64');
	      sy+=16;

	      // End hour combo
	      m_tab1_end_hour_combo.MainPointer(m_tab1_card_schedule);
	      m_tabs.AddToElementsArray(0,m_tab1_end_hour_combo);
	      m_tab1_end_hour_combo.XSize(time_w);
	      m_tab1_end_hour_combo.YSize(control_h);
	      m_tab1_end_hour_combo.BackColor(clrWhite);
	      m_tab1_end_hour_combo.BackColorHover(clrWhite);
	      m_tab1_end_hour_combo.BackColorPressed(clrWhite);
	      m_tab1_end_hour_combo.BorderColor(field_border);
	      m_tab1_end_hour_combo.BorderColorHover(field_border);
	      m_tab1_end_hour_combo.BorderColorPressed(field_border);
	      m_tab1_end_hour_combo.FontSize(10);
	      m_tab1_end_hour_combo.ItemsTotal(ArraySize(items_hour));
	      m_tab1_end_hour_combo.CheckBoxMode(false);
	      m_tab1_end_hour_combo.GetButtonPointer().XGap(1);
	      m_tab1_end_hour_combo.GetButtonPointer().XSize(time_w-2);
	      m_tab1_end_hour_combo.GetButtonPointer().YSize(control_h);
	      m_tab1_end_hour_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab1_end_hour_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab1_end_hour_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab1_end_hour_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_end_hour_combo.GetButtonPointer().BorderColor(field_border);
	      m_tab1_end_hour_combo.GetButtonPointer().BorderColorHover(field_border);
	      m_tab1_end_hour_combo.GetButtonPointer().BorderColorPressed(field_border);
	      m_tab1_end_hour_combo.GetButtonPointer().IconXGap((time_w-2)-18);
	      m_tab1_end_hour_combo.GetButtonPointer().LabelXGap(8);
	      m_tab1_end_hour_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_hour);i++) m_tab1_end_hour_combo.SetValue(i,items_hour[i]);
	      m_tab1_end_hour_combo.GetListViewPointer().YSize(160);
	      m_tab1_end_hour_combo.GetListViewPointer().LightsHover(true);
	      m_tab1_end_hour_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_end_hour_combo.CreateComboBox("",hour_x,sy))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_end_hour_combo);
	      m_tab1_end_hour_combo.SelectItem(17);

	      // End min combo
	      m_tab1_end_min_combo.MainPointer(m_tab1_card_schedule);
	      m_tabs.AddToElementsArray(0,m_tab1_end_min_combo);
	      m_tab1_end_min_combo.XSize(time_w);
	      m_tab1_end_min_combo.YSize(control_h);
	      m_tab1_end_min_combo.BackColor(clrWhite);
	      m_tab1_end_min_combo.BackColorHover(clrWhite);
	      m_tab1_end_min_combo.BackColorPressed(clrWhite);
	      m_tab1_end_min_combo.BorderColor(field_border);
	      m_tab1_end_min_combo.BorderColorHover(field_border);
	      m_tab1_end_min_combo.BorderColorPressed(field_border);
	      m_tab1_end_min_combo.FontSize(10);
	      m_tab1_end_min_combo.ItemsTotal(ArraySize(items_min));
	      m_tab1_end_min_combo.CheckBoxMode(false);
	      m_tab1_end_min_combo.GetButtonPointer().XGap(1);
	      m_tab1_end_min_combo.GetButtonPointer().XSize(time_w-2);
	      m_tab1_end_min_combo.GetButtonPointer().YSize(control_h);
	      m_tab1_end_min_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab1_end_min_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab1_end_min_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab1_end_min_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_end_min_combo.GetButtonPointer().BorderColor(field_border);
	      m_tab1_end_min_combo.GetButtonPointer().BorderColorHover(field_border);
	      m_tab1_end_min_combo.GetButtonPointer().BorderColorPressed(field_border);
	      m_tab1_end_min_combo.GetButtonPointer().IconXGap((time_w-2)-18);
	      m_tab1_end_min_combo.GetButtonPointer().LabelXGap(8);
	      m_tab1_end_min_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_min);i++) m_tab1_end_min_combo.SetValue(i,items_min[i]);
	      m_tab1_end_min_combo.GetListViewPointer().YSize(160);
	      m_tab1_end_min_combo.GetListViewPointer().LightsHover(true);
	      m_tab1_end_min_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_end_min_combo.CreateComboBox("",min_x,sy))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_end_min_combo);
	      m_tab1_end_min_combo.SelectItem(0);

	      // Separator between Horario and Zeragem
	      sy+=control_h+14;
	      m_tab1_card_schedule_sep.MainPointer(m_tab1_card_schedule);
	      m_tabs.AddToElementsArray(0,m_tab1_card_schedule_sep);
	      m_tab1_card_schedule_sep.DarkColor(C'197,168,136');
	      m_tab1_card_schedule_sep.LightColor(C'233,220,203');
	      m_tab1_card_schedule_sep.TypeSepLine(H_SEP_LINE);
	      if(!m_tab1_card_schedule_sep.CreateSeparateLine(sched_x,sy,sched_w,2))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_card_schedule_sep);
	      sy+=10;

	      // Zeragem
	      int zy=sy;
	      if(!CreateTextLabel(m_tab1_zero_label,"Zerar posicoes",m_tab1_card_schedule,m_window_index,m_tabs,0,sched_x,zy,sched_w,18))
	         return(false);
	      m_tab1_zero_label.LabelColor(C'91,78,64');
	      zy+=22;

	      string items_zero[];
	      ArrayResize(items_zero,2);
	      items_zero[0]="Nao";
	      items_zero[1]="Sim";

	      m_tab1_zero_combo.MainPointer(m_tab1_card_schedule);
	      m_tabs.AddToElementsArray(0,m_tab1_zero_combo);
	      m_tab1_zero_combo.XSize(sched_w);
	      m_tab1_zero_combo.YSize(control_h);
	      m_tab1_zero_combo.BackColor(clrWhite);
	      m_tab1_zero_combo.BackColorHover(clrWhite);
	      m_tab1_zero_combo.BackColorPressed(clrWhite);
	      m_tab1_zero_combo.BorderColor(field_border);
	      m_tab1_zero_combo.BorderColorHover(field_border);
	      m_tab1_zero_combo.BorderColorPressed(field_border);
	      m_tab1_zero_combo.FontSize(10);
	      m_tab1_zero_combo.ItemsTotal(ArraySize(items_zero));
	      m_tab1_zero_combo.CheckBoxMode(false);
	      m_tab1_zero_combo.GetButtonPointer().XGap(1);
	      m_tab1_zero_combo.GetButtonPointer().XSize(sched_w-2);
	      m_tab1_zero_combo.GetButtonPointer().YSize(control_h);
	      m_tab1_zero_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab1_zero_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab1_zero_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab1_zero_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_zero_combo.GetButtonPointer().BorderColor(field_border);
	      m_tab1_zero_combo.GetButtonPointer().BorderColorHover(field_border);
	      m_tab1_zero_combo.GetButtonPointer().BorderColorPressed(field_border);
	      m_tab1_zero_combo.GetButtonPointer().IconXGap((sched_w-2)-18);
	      m_tab1_zero_combo.GetButtonPointer().LabelXGap(10);
	      m_tab1_zero_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_zero);i++) m_tab1_zero_combo.SetValue(i,items_zero[i]);
	      m_tab1_zero_combo.GetListViewPointer().YSize(120);
	      m_tab1_zero_combo.GetListViewPointer().LightsHover(true);
	      m_tab1_zero_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_zero_combo.CreateComboBox("",sched_x,zy))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_zero_combo);
	      m_tab1_zero_combo.SelectItem(0);

	      zy+=control_h+12;
	      if(!CreateTextLabel(m_tab1_zero_time_label,"Horario de zeragem",m_tab1_card_schedule,m_window_index,m_tabs,0,sched_x,zy,sched_w,18))
	         return(false);
	      m_tab1_zero_time_label.LabelColor(C'91,78,64');
	      zy+=22;
	      if(!CreateTextLabel(m_tab1_zero_hour_label,"Hora",m_tab1_card_schedule,m_window_index,m_tabs,0,hour_x,zy,time_w,14))
	         return(false);
	      m_tab1_zero_hour_label.LabelColor(C'91,78,64');
	      if(!CreateTextLabel(m_tab1_zero_min_label,"Min",m_tab1_card_schedule,m_window_index,m_tabs,0,min_x,zy,time_w,14))
	         return(false);
	      m_tab1_zero_min_label.LabelColor(C'91,78,64');
	      zy+=16;

	      // Zero hour combo
	      m_tab1_zero_hour_combo.MainPointer(m_tab1_card_schedule);
	      m_tabs.AddToElementsArray(0,m_tab1_zero_hour_combo);
	      m_tab1_zero_hour_combo.XSize(time_w);
	      m_tab1_zero_hour_combo.YSize(control_h);
	      m_tab1_zero_hour_combo.BackColor(clrWhite);
	      m_tab1_zero_hour_combo.BackColorHover(clrWhite);
	      m_tab1_zero_hour_combo.BackColorPressed(clrWhite);
	      m_tab1_zero_hour_combo.BorderColor(field_border);
	      m_tab1_zero_hour_combo.BorderColorHover(field_border);
	      m_tab1_zero_hour_combo.BorderColorPressed(field_border);
	      m_tab1_zero_hour_combo.FontSize(10);
	      m_tab1_zero_hour_combo.ItemsTotal(ArraySize(items_hour));
	      m_tab1_zero_hour_combo.CheckBoxMode(false);
	      m_tab1_zero_hour_combo.GetButtonPointer().XGap(1);
	      m_tab1_zero_hour_combo.GetButtonPointer().XSize(time_w-2);
	      m_tab1_zero_hour_combo.GetButtonPointer().YSize(control_h);
	      m_tab1_zero_hour_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab1_zero_hour_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab1_zero_hour_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab1_zero_hour_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_zero_hour_combo.GetButtonPointer().BorderColor(field_border);
	      m_tab1_zero_hour_combo.GetButtonPointer().BorderColorHover(field_border);
	      m_tab1_zero_hour_combo.GetButtonPointer().BorderColorPressed(field_border);
	      m_tab1_zero_hour_combo.GetButtonPointer().IconXGap((time_w-2)-18);
	      m_tab1_zero_hour_combo.GetButtonPointer().LabelXGap(8);
	      m_tab1_zero_hour_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_hour);i++) m_tab1_zero_hour_combo.SetValue(i,items_hour[i]);
	      m_tab1_zero_hour_combo.GetListViewPointer().YSize(160);
	      m_tab1_zero_hour_combo.GetListViewPointer().LightsHover(true);
	      m_tab1_zero_hour_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_zero_hour_combo.CreateComboBox("",hour_x,zy))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_zero_hour_combo);
	      m_tab1_zero_hour_combo.SelectItem(17);

	      // Zero min combo
	      m_tab1_zero_min_combo.MainPointer(m_tab1_card_schedule);
	      m_tabs.AddToElementsArray(0,m_tab1_zero_min_combo);
	      m_tab1_zero_min_combo.XSize(time_w);
	      m_tab1_zero_min_combo.YSize(control_h);
	      m_tab1_zero_min_combo.BackColor(clrWhite);
	      m_tab1_zero_min_combo.BackColorHover(clrWhite);
	      m_tab1_zero_min_combo.BackColorPressed(clrWhite);
	      m_tab1_zero_min_combo.BorderColor(field_border);
	      m_tab1_zero_min_combo.BorderColorHover(field_border);
	      m_tab1_zero_min_combo.BorderColorPressed(field_border);
	      m_tab1_zero_min_combo.FontSize(10);
	      m_tab1_zero_min_combo.ItemsTotal(ArraySize(items_min));
	      m_tab1_zero_min_combo.CheckBoxMode(false);
	      m_tab1_zero_min_combo.GetButtonPointer().XGap(1);
	      m_tab1_zero_min_combo.GetButtonPointer().XSize(time_w-2);
	      m_tab1_zero_min_combo.GetButtonPointer().YSize(control_h);
	      m_tab1_zero_min_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab1_zero_min_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab1_zero_min_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab1_zero_min_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_zero_min_combo.GetButtonPointer().BorderColor(field_border);
	      m_tab1_zero_min_combo.GetButtonPointer().BorderColorHover(field_border);
	      m_tab1_zero_min_combo.GetButtonPointer().BorderColorPressed(field_border);
	      m_tab1_zero_min_combo.GetButtonPointer().IconXGap((time_w-2)-18);
	      m_tab1_zero_min_combo.GetButtonPointer().LabelXGap(8);
	      m_tab1_zero_min_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_min);i++) m_tab1_zero_min_combo.SetValue(i,items_min[i]);
	      m_tab1_zero_min_combo.GetListViewPointer().YSize(160);
	      m_tab1_zero_min_combo.GetListViewPointer().LightsHover(true);
	      m_tab1_zero_min_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_zero_min_combo.CreateComboBox("",min_x,zy))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_zero_min_combo);
	      m_tab1_zero_min_combo.SelectItem(30);

	      // Config inicial card (from original Tab 3)
	      int cy=start_y;
	      if(!CreateTextLabel(m_tab1_tempo_label,"Tempo grafico",m_tab1_card_config,m_window_index,m_tabs,0,field_x,cy,field_w,label_h))
	         return(false);
	      m_tab1_tempo_label.LabelColor(C'91,78,64');
	      cy+=label_h+4;

	      m_tab1_tempo_combo.MainPointer(m_tab1_card_config);
	      m_tabs.AddToElementsArray(0,m_tab1_tempo_combo);
	      m_tab1_tempo_combo.XSize(field_w);
	      m_tab1_tempo_combo.YSize(control_h);
	      m_tab1_tempo_combo.BackColor(clrWhite);
	      m_tab1_tempo_combo.BackColorHover(clrWhite);
	      m_tab1_tempo_combo.BackColorPressed(clrWhite);
	      m_tab1_tempo_combo.BorderColor(field_border);
	      m_tab1_tempo_combo.BorderColorHover(field_border);
	      m_tab1_tempo_combo.BorderColorPressed(field_border);
	      m_tab1_tempo_combo.FontSize(10);
	      m_tab1_tempo_combo.ItemsTotal(ArraySize(items_tf));
	      m_tab1_tempo_combo.CheckBoxMode(false);
	      m_tab1_tempo_combo.GetButtonPointer().XGap(control_btn_x);
	      m_tab1_tempo_combo.GetButtonPointer().XSize(control_btn_w);
	      m_tab1_tempo_combo.GetButtonPointer().YSize(control_h);
	      m_tab1_tempo_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab1_tempo_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab1_tempo_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab1_tempo_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_tempo_combo.GetButtonPointer().BorderColor(field_border);
	      m_tab1_tempo_combo.GetButtonPointer().BorderColorHover(field_border);
	      m_tab1_tempo_combo.GetButtonPointer().BorderColorPressed(field_border);
	      m_tab1_tempo_combo.GetButtonPointer().IconXGap(control_btn_w-18);
	      m_tab1_tempo_combo.GetButtonPointer().LabelXGap(10);
	      m_tab1_tempo_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_tf);i++) m_tab1_tempo_combo.SetValue(i,items_tf[i]);
	      m_tab1_tempo_combo.GetListViewPointer().YSize(200);
	      m_tab1_tempo_combo.GetListViewPointer().LightsHover(true);
	      m_tab1_tempo_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab1_tempo_combo.CreateComboBox("",field_x,cy))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab1_tempo_combo);
	      m_tab1_tempo_combo.SelectItem(0);

	      cy+=control_h+v_gap;
	      if(!CreateTextLabel(m_tab1_volume_label,"Volume inicial",m_tab1_card_config,m_window_index,m_tabs,0,field_x,cy,field_w,label_h))
	         return(false);
	      m_tab1_volume_label.LabelColor(C'91,78,64');
	      cy+=label_h+4;
	      if(!CreateTextEdit(m_tab1_volume_edit,"",m_tab1_card_config,m_window_index,m_tabs,0,false,field_x,cy,field_w,edit_w,"1",""))
	         return(false);

	      cy+=control_h+v_gap;
	      if(!CreateTextLabel(m_tab1_spread_label,"Spread maximo",m_tab1_card_config,m_window_index,m_tabs,0,field_x,cy,field_w,label_h))
	         return(false);
	      m_tab1_spread_label.LabelColor(C'91,78,64');
	      cy+=label_h+4;
	      // EasyAndFastGUI: SpinEdit e um CTextEdit em modo numerico (com botoes +/-).
	      if(!CreateTextEdit(m_tab1_spread_edit,"",m_tab1_card_config,m_window_index,m_tabs,0,false,field_x,cy,field_w,edit_w,
	                         100000.0,0.0,1.0,0,10.0))
	         return(false);
	      // Style similar to other inputs
	      m_tab1_spread_edit.BackColor(clrWhite);
	      m_tab1_spread_edit.BackColorHover(clrWhite);
	      m_tab1_spread_edit.BackColorPressed(clrWhite);
	      m_tab1_spread_edit.BorderColor(field_border);
	      m_tab1_spread_edit.BorderColorHover(field_border);
	      m_tab1_spread_edit.BorderColorPressed(field_border);
	      m_tab1_spread_edit.GetTextBoxPointer().BackColor(clrWhite);
	      m_tab1_spread_edit.GetTextBoxPointer().BackColorHover(clrWhite);
	      m_tab1_spread_edit.GetTextBoxPointer().BackColorPressed(clrWhite);
	      m_tab1_spread_edit.GetTextBoxPointer().BorderColor(field_border);
	      m_tab1_spread_edit.GetTextBoxPointer().BorderColorHover(field_border);
	      m_tab1_spread_edit.GetTextBoxPointer().BorderColorPressed(field_border);
	      m_tab1_spread_edit.GetIncButtonPointer().BackColor(clrWhite);
	      m_tab1_spread_edit.GetIncButtonPointer().BackColorHover(clrWhite);
	      m_tab1_spread_edit.GetIncButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_spread_edit.GetIncButtonPointer().BorderColor(field_border);
	      m_tab1_spread_edit.GetIncButtonPointer().BorderColorHover(field_border);
	      m_tab1_spread_edit.GetIncButtonPointer().BorderColorPressed(field_border);
	      m_tab1_spread_edit.GetDecButtonPointer().BackColor(clrWhite);
	      m_tab1_spread_edit.GetDecButtonPointer().BackColorHover(clrWhite);
	      m_tab1_spread_edit.GetDecButtonPointer().BackColorPressed(clrWhite);
	      m_tab1_spread_edit.GetDecButtonPointer().BorderColor(field_border);
	      m_tab1_spread_edit.GetDecButtonPointer().BorderColorHover(field_border);
	      m_tab1_spread_edit.GetDecButtonPointer().BorderColorPressed(field_border);

	      // Signal direction checkboxes (tabs 2..9)
	      for(int i=1; i<EASY_TAB_COUNT; i++)
	        {
	         const int sig_x=content_pad;
	         const int sig_y=content_y;
	         const int sig_gap=18;
	         const int sig_w=240;
	         const int sig2_x=sig_x + sig_w + sig_gap;

	         if(!CreateCheckbox(m_tab_signal_buy[i],"Criar sinal de compra",m_tabs,m_window_index,m_tabs,i,sig_x,sig_y,sig_w,m_signal_is_buy,false,false))
	            return(false);
	         m_tab_signal_buy[i].FontSize(10);
	         m_tab_signal_buy[i].LabelColor(C'43,43,43');

	         if(!CreateCheckbox(m_tab_signal_sell[i],"Criar sinal de venda",m_tabs,m_window_index,m_tabs,i,sig2_x,sig_y,sig_w,!m_signal_is_buy,false,false))
	            return(false);
	         m_tab_signal_sell[i].FontSize(10);
	         m_tab_signal_sell[i].LabelColor(C'43,43,43');

	         const int info_y=sig_y+22;
	         if(!CreateTextLabel(m_tab_signal_info[i],"",m_tabs,m_window_index,m_tabs,i,content_pad,info_y,tabs_w-(content_pad*2),34))
	            return(false);
	         m_tab_signal_info[i].FontSize(10);
	         m_tab_signal_info[i].LabelColor(C'91,78,64');
	        }

	      // Keep placeholders for remaining tabs
	      for(int i=1; i<EASY_TAB_COUNT; i++)
	        {
	         if(i==4) // Tab 5 (Break even): content migrated below
	            continue;
	         if(i==5) // Tab 6 (Trailing stop): content migrated below
	            continue;
	         if(i==6) // Tab 7 (Saidas parciais): content migrated below
	            continue;
	         string placeholder="Conteudo: "+tab_text[i]+" (em migracao)";
	         const int ph_y=(i==1 || i==2 ? content_y+520 : content_y+66);
	         if(!CreateTextLabel(m_tab_placeholders[i],placeholder,m_tabs,m_window_index,m_tabs,i,content_pad,ph_y,tabs_w-(content_pad*2),22))
	            return(false);
	         m_tab_placeholders[i].FontSize(11);
	         m_tab_placeholders[i].LabelColor(C'91,78,64');
	        }

	      // Tab 2 (Stop loss) - first card
	      const int tab2_x=content_pad;
	      const int tab2_y=content_y+120;
	      const int tab2_w=card_w;
	      const int tab2_h=340;
	      const color tab2_border=C'91,78,64';

	      if(!CreateFrame(m_tab2_card_stopfix,"",m_tabs,m_window_index,m_tabs,1,tab2_x,tab2_y,tab2_w,tab2_h,1))
	         return(false);
	      m_tab2_card_stopfix.BackColor(C'233,220,203');
	      m_tab2_card_stopfix.BorderColor(C'197,168,136');

	      if(!CreateTextLabel(m_tab2_card_title,"Stop loss (fixo)",m_tab2_card_stopfix,m_window_index,m_tabs,1,16,12,tab2_w-32,22))
	         return(false);
	      m_tab2_card_title.FontSize(12);
	      m_tab2_card_title.LabelColor(C'43,43,43');

	      if(!CreateCheckbox(m_tab2_use_fixed,"Usar stop fixo",m_tab2_card_stopfix,m_window_index,m_tabs,1,16,44,tab2_w-32,false,false,false))
	         return(false);
	      m_tab2_use_fixed.FontSize(10);
	      m_tab2_use_fixed.LabelColor(C'43,43,43');

	      // Second card: Stop loss (calculo)
	      const int tab2_calc_card_x=content_pad + card_w + card_gap;
	      if(!CreateFrame(m_tab2_card_calc,"",m_tabs,m_window_index,m_tabs,1,tab2_calc_card_x,tab2_y,tab2_w,tab2_h,1))
	         return(false);
	      m_tab2_card_calc.BackColor(C'233,220,203');
	      m_tab2_card_calc.BorderColor(C'197,168,136');

	      if(!CreateTextLabel(m_tab2_card_calc_title,"Stop loss (calculo)",m_tab2_card_calc,m_window_index,m_tabs,1,16,12,tab2_w-32,22))
	         return(false);
	      m_tab2_card_calc_title.FontSize(12);
	      m_tab2_card_calc_title.LabelColor(C'43,43,43');

	      if(!CreateCheckbox(m_tab2_use_calc,"Usar calculo",m_tab2_card_calc,m_window_index,m_tabs,1,16,34,tab2_w-32,false,false,false))
	         return(false);
	      m_tab2_use_calc.FontSize(10);
	      m_tab2_use_calc.LabelColor(C'43,43,43');

	      // Third card: Stop loss (multiplicador) - placeholder (migracao)
	      const int tab2_mult_card_x=content_pad + (card_w + card_gap) * 2;
	      if(!CreateFrame(m_tab2_card_mult,"",m_tabs,m_window_index,m_tabs,1,tab2_mult_card_x,tab2_y,tab2_w,tab2_h,1))
	         return(false);
	      m_tab2_card_mult.BackColor(C'233,220,203');
	      m_tab2_card_mult.BorderColor(C'197,168,136');

	      if(!CreateTextLabel(m_tab2_card_mult_title,"Stop loss (multiplicador)",m_tab2_card_mult,m_window_index,m_tabs,1,16,12,tab2_w-32,22))
	         return(false);
	      m_tab2_card_mult_title.FontSize(12);
	      m_tab2_card_mult_title.LabelColor(C'43,43,43');

	      if(!CreateCheckbox(m_tab2_use_mult,"Usar multiplicador",m_tab2_card_mult,m_window_index,m_tabs,1,16,34,tab2_w-32,false,false,false))
	         return(false);
	      m_tab2_use_mult.FontSize(10);
	      m_tab2_use_mult.LabelColor(C'43,43,43');

	      // Controls
	      const int mult_pad=16;
	      const int mult_w=tab2_w-32;
	      int mult_y=66;

	      if(!CreateTextLabel(m_tab2_mult_base_label,"Base:",m_tab2_card_mult,m_window_index,m_tabs,1,mult_pad,mult_y,mult_w,18))
	         return(false);
	      m_tab2_mult_base_label.FontSize(10);
	      m_tab2_mult_base_label.LabelColor(C'91,78,64');
	      mult_y+=22;

	      string mult_base_items[];
	      ArrayResize(mult_base_items,2);
	      mult_base_items[0]="Corpo do candle";
	      mult_base_items[1]="Range (pavio a pavio)";

	      m_tab2_mult_base_combo.MainPointer(m_tab2_card_mult);
	      m_tabs.AddToElementsArray(1,m_tab2_mult_base_combo);
	      m_tab2_mult_base_combo.XSize(mult_w);
	      m_tab2_mult_base_combo.YSize(20);
	      m_tab2_mult_base_combo.BackColor(clrWhite);
	      m_tab2_mult_base_combo.BackColorHover(clrWhite);
	      m_tab2_mult_base_combo.BackColorPressed(clrWhite);
	      m_tab2_mult_base_combo.BorderColor(tab2_border);
	      m_tab2_mult_base_combo.BorderColorHover(tab2_border);
	      m_tab2_mult_base_combo.BorderColorPressed(tab2_border);
	      m_tab2_mult_base_combo.FontSize(10);
	      m_tab2_mult_base_combo.ItemsTotal(ArraySize(mult_base_items));
	      m_tab2_mult_base_combo.CheckBoxMode(false);
	      m_tab2_mult_base_combo.GetButtonPointer().XGap(1);
	      m_tab2_mult_base_combo.GetButtonPointer().XSize(mult_w-2);
	      m_tab2_mult_base_combo.GetButtonPointer().YSize(20);
	      m_tab2_mult_base_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_mult_base_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_mult_base_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_mult_base_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_mult_base_combo.GetButtonPointer().BorderColor(tab2_border);
	      m_tab2_mult_base_combo.GetButtonPointer().BorderColorHover(tab2_border);
	      m_tab2_mult_base_combo.GetButtonPointer().BorderColorPressed(tab2_border);
	      m_tab2_mult_base_combo.GetButtonPointer().IconXGap((mult_w-2)-18);
	      m_tab2_mult_base_combo.GetButtonPointer().LabelXGap(10);
	      m_tab2_mult_base_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(mult_base_items);i++) m_tab2_mult_base_combo.SetValue(i,mult_base_items[i]);
	      m_tab2_mult_base_combo.GetListViewPointer().YSize(80);
	      m_tab2_mult_base_combo.GetListViewPointer().LightsHover(true);
	      m_tab2_mult_base_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_mult_base_combo.CreateComboBox("",mult_pad,mult_y))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_mult_base_combo);
	      m_tab2_mult_base_combo.SelectItem(0);
	      mult_y+=28;

	      if(!CreateTextLabel(m_tab2_mult_candle_label,"Candle:",m_tab2_card_mult,m_window_index,m_tabs,1,mult_pad,mult_y,mult_w,18))
	         return(false);
	      m_tab2_mult_candle_label.FontSize(10);
	      m_tab2_mult_candle_label.LabelColor(C'91,78,64');
	      mult_y+=22;

	      string mult_candle_items[];
	      ArrayResize(mult_candle_items,4);
	      mult_candle_items[0]="Atual";
	      mult_candle_items[1]="Ultimo";
	      mult_candle_items[2]="Penultimo";
	      mult_candle_items[3]="Antipenultimo";

	      m_tab2_mult_candle_combo.MainPointer(m_tab2_card_mult);
	      m_tabs.AddToElementsArray(1,m_tab2_mult_candle_combo);
	      m_tab2_mult_candle_combo.XSize(mult_w);
	      m_tab2_mult_candle_combo.YSize(20);
	      m_tab2_mult_candle_combo.BackColor(clrWhite);
	      m_tab2_mult_candle_combo.BackColorHover(clrWhite);
	      m_tab2_mult_candle_combo.BackColorPressed(clrWhite);
	      m_tab2_mult_candle_combo.BorderColor(tab2_border);
	      m_tab2_mult_candle_combo.BorderColorHover(tab2_border);
	      m_tab2_mult_candle_combo.BorderColorPressed(tab2_border);
	      m_tab2_mult_candle_combo.FontSize(10);
	      m_tab2_mult_candle_combo.ItemsTotal(ArraySize(mult_candle_items));
	      m_tab2_mult_candle_combo.CheckBoxMode(false);
	      m_tab2_mult_candle_combo.GetButtonPointer().XGap(1);
	      m_tab2_mult_candle_combo.GetButtonPointer().XSize(mult_w-2);
	      m_tab2_mult_candle_combo.GetButtonPointer().YSize(20);
	      m_tab2_mult_candle_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_mult_candle_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_mult_candle_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_mult_candle_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_mult_candle_combo.GetButtonPointer().BorderColor(tab2_border);
	      m_tab2_mult_candle_combo.GetButtonPointer().BorderColorHover(tab2_border);
	      m_tab2_mult_candle_combo.GetButtonPointer().BorderColorPressed(tab2_border);
	      m_tab2_mult_candle_combo.GetButtonPointer().IconXGap((mult_w-2)-18);
	      m_tab2_mult_candle_combo.GetButtonPointer().LabelXGap(10);
	      m_tab2_mult_candle_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(mult_candle_items);i++) m_tab2_mult_candle_combo.SetValue(i,mult_candle_items[i]);
	      m_tab2_mult_candle_combo.GetListViewPointer().YSize(120);
	      m_tab2_mult_candle_combo.GetListViewPointer().LightsHover(true);
	      m_tab2_mult_candle_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_mult_candle_combo.CreateComboBox("",mult_pad,mult_y))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_mult_candle_combo);
	      m_tab2_mult_candle_combo.SelectItem(0);
	      mult_y+=28;

	      if(!CreateTextLabel(m_tab2_mult_qty_label,"Multiplicador:",m_tab2_card_mult,m_window_index,m_tabs,1,mult_pad,mult_y,mult_w,18))
	         return(false);
	      m_tab2_mult_qty_label.FontSize(10);
	      m_tab2_mult_qty_label.LabelColor(C'91,78,64');
	      mult_y+=22;

	      // SpinEdit - multiplicador
	      m_tab2_mult_qty_spin.MainPointer(m_tab2_card_mult);
	      m_tabs.AddToElementsArray(1,m_tab2_mult_qty_spin);
	      m_tab2_mult_qty_spin.XSize(mult_w);
	      m_tab2_mult_qty_spin.MaxValue(1000.0);
	      m_tab2_mult_qty_spin.MinValue(0.0);
	      m_tab2_mult_qty_spin.StepValue(0.1);
	      m_tab2_mult_qty_spin.SetDigits(2);
	      m_tab2_mult_qty_spin.SpinEditMode(true);
	      m_tab2_mult_qty_spin.CheckBoxMode(false);
	      m_tab2_mult_qty_spin.SetValue("1.0");
	      m_tab2_mult_qty_spin.GetTextBoxPointer().XSize(mult_w-34);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().AutoSelectionMode(true);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().XGap(1);
	      if(!m_tab2_mult_qty_spin.CreateTextEdit("",mult_pad,mult_y))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_mult_qty_spin);
	      m_tab2_mult_qty_spin.BackColor(C'233,220,203');
	      m_tab2_mult_qty_spin.BackColorHover(C'233,220,203');
	      m_tab2_mult_qty_spin.BackColorPressed(C'233,220,203');
	      m_tab2_mult_qty_spin.BorderColor(tab2_border);
	      m_tab2_mult_qty_spin.BorderColorHover(tab2_border);
	      m_tab2_mult_qty_spin.BorderColorPressed(tab2_border);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().BackColor(clrWhite);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().BackColorHover(clrWhite);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().BorderColor(tab2_border);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
	      m_tab2_mult_qty_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
	      m_tab2_mult_qty_spin.GetIncButtonPointer().BackColor(clrWhite);
	      m_tab2_mult_qty_spin.GetIncButtonPointer().BackColorHover(clrWhite);
	      m_tab2_mult_qty_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_mult_qty_spin.GetIncButtonPointer().BorderColor(tab2_border);
	      m_tab2_mult_qty_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
	      m_tab2_mult_qty_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
	      m_tab2_mult_qty_spin.GetDecButtonPointer().BackColor(clrWhite);
	      m_tab2_mult_qty_spin.GetDecButtonPointer().BackColorHover(clrWhite);
	      m_tab2_mult_qty_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_mult_qty_spin.GetDecButtonPointer().BorderColor(tab2_border);
	      m_tab2_mult_qty_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
	      m_tab2_mult_qty_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

	      // Tabs inside "Stop loss (calculo)"
	      const int calc_tabs_x=16;
	      const int calc_tabs_y=76;
	      const int calc_tabs_w=tab2_w-32;
	      const int calc_tabs_h=tab2_h-92;
	      const int calc_tab_h=22;

	      string calc_tab_text[];
	      int calc_tab_widths[];
	      ArrayResize(calc_tab_text,3);
	      ArrayResize(calc_tab_widths,3);
	      calc_tab_text[0]="Ref.";
	      calc_tab_text[1]="Med.";
	      calc_tab_text[2]="Max/Min";
	      calc_tab_widths[0]=74;
	      calc_tab_widths[1]=64;
	      calc_tab_widths[2]=82;

	      m_tab2_calc_tabs.MainPointer(m_tab2_card_calc);
	      m_tabs.AddToElementsArray(1,m_tab2_calc_tabs);
	      m_tab2_calc_tabs.XSize(calc_tabs_w);
	      m_tab2_calc_tabs.YSize(calc_tabs_h);
	      m_tab2_calc_tabs.IsCenterText(true);
	      m_tab2_calc_tabs.PositionMode(TABS_TOP);
	      m_tab2_calc_tabs.TabsYSize(calc_tab_h);
	      m_tab2_calc_tabs.AutoXResizeMode(false);
	      m_tab2_calc_tabs.AutoYResizeMode(false);
	      // Match card palette
	      m_tab2_calc_tabs.BackColorPressed(C'233,220,203');
	      m_tab2_calc_tabs.BorderColor(C'197,168,136');
	      m_tab2_calc_tabs.BorderColorHover(C'197,168,136');
	      m_tab2_calc_tabs.BorderColorPressed(C'197,168,136');

	      for(int i=0; i<3; i++)
	         m_tab2_calc_tabs.AddTab(calc_tab_text[i],calc_tab_widths[i]);

	      if(!m_tab2_calc_tabs.CreateTabs(calc_tabs_x,calc_tabs_y))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_tabs);

	      CEF_CButtonsGroup *calc_bg=m_tab2_calc_tabs.GetButtonsGroupPointer();
	      if(calc_bg!=NULL)
	        {
	         for(int i=0; i<3; i++)
	           {
	            calc_bg.GetButtonPointer(i).FontSize(8);
	            calc_bg.GetButtonPointer(i).BackColor(C'39,54,78');
	            calc_bg.GetButtonPointer(i).BackColorHover(C'62,79,101');
	            calc_bg.GetButtonPointer(i).BackColorPressed(C'226,114,64');
	            calc_bg.GetButtonPointer(i).BorderColor(C'18,29,43');
	            calc_bg.GetButtonPointer(i).BorderColorHover(C'62,79,101');
	            calc_bg.GetButtonPointer(i).BorderColorPressed(C'240,140,86');
	            calc_bg.GetButtonPointer(i).LabelColor(clrWhite);
	            calc_bg.GetButtonPointer(i).LabelColorHover(clrWhite);
	            calc_bg.GetButtonPointer(i).LabelColorPressed(clrWhite);
	           }
	        }

	      const int calc_content_x=12;
	      const int calc_content_y=6;
	      const int calc_content_w=calc_tabs_w-(calc_content_x*2);

	      if(!CreateCheckbox(m_tab2_calc_ref_check,"Referencia",m_tab2_calc_tabs,m_window_index,m_tab2_calc_tabs,0,calc_content_x,calc_content_y,140,false,false,false))
	         return(false);
	      m_tab2_calc_ref_check.FontSize(10);
	      m_tab2_calc_ref_check.LabelColor(C'43,43,43');

	      if(!CreateCheckbox(m_tab2_calc_media_check,"Media",m_tab2_calc_tabs,m_window_index,m_tab2_calc_tabs,1,calc_content_x,calc_content_y,140,false,false,false))
	         return(false);
	      m_tab2_calc_media_check.FontSize(10);
	      m_tab2_calc_media_check.LabelColor(C'43,43,43');

	      if(!CreateCheckbox(m_tab2_calc_maxmin_check,"Max/Min",m_tab2_calc_tabs,m_window_index,m_tab2_calc_tabs,2,calc_content_x,calc_content_y,140,false,false,false))
	         return(false);
	      m_tab2_calc_maxmin_check.FontSize(10);
	      m_tab2_calc_maxmin_check.LabelColor(C'43,43,43');

	      // Sub-cards (ported from CPanel Tab 9 "Sinais" first card: Referencia/Media)
	      const int subcard_x=calc_content_x;
	      const int subcard_y=calc_content_y+18;
	      const int subcard_w=calc_content_w;
	      const int subcard_h=calc_tabs_h - subcard_y - 10;
	      const color sub_back=C'239,231,218';
	      const color sub_border=C'197,168,136';

	      if(!CreateFrame(m_tab2_calc_ref_card,"",m_tab2_calc_tabs,m_window_index,m_tab2_calc_tabs,0,subcard_x,subcard_y,subcard_w,subcard_h,1))
	         return(false);
	      m_tab2_calc_ref_card.BackColor(sub_back);
	      m_tab2_calc_ref_card.BorderColor(sub_border);

	      if(!CreateFrame(m_tab2_calc_media_card,"",m_tab2_calc_tabs,m_window_index,m_tab2_calc_tabs,1,subcard_x,subcard_y,subcard_w,subcard_h,1))
	         return(false);
	      m_tab2_calc_media_card.BackColor(sub_back);
	      m_tab2_calc_media_card.BorderColor(sub_border);

	      if(!CreateFrame(m_tab2_calc_maxmin_card,"",m_tab2_calc_tabs,m_window_index,m_tab2_calc_tabs,2,subcard_x,subcard_y,subcard_w,subcard_h,1))
	         return(false);
	      m_tab2_calc_maxmin_card.BackColor(sub_back);
	      m_tab2_calc_maxmin_card.BorderColor(sub_border);

	      // Reference tab controls
	      const int fpad=12;
	      const int f_w=subcard_w-(fpad*2);
	      const int sub_label_h=16;
	      const int sub_control_h=20;
	      const int sub_vgap=8;
	      const int sub_btn_w=f_w-2;
	      const int sub_btn_x=1;
	      int ry=10;

	      if(!CreateTextLabel(m_tab2_calc_ref_base_label,"Referencia:",m_tab2_calc_ref_card,m_window_index,m_tab2_calc_tabs,0,fpad,ry,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_ref_base_label.FontSize(9);
	      m_tab2_calc_ref_base_label.LabelColor(C'91,78,64');
	      ry+=sub_label_h+2;

	      string ref_items[];
	      ArrayResize(ref_items,4);
	      ref_items[0]="Maxima";
	      ref_items[1]="Minima";
	      ref_items[2]="Abertura";
	      ref_items[3]="Fechamento";

	      m_tab2_calc_ref_base_combo.MainPointer(m_tab2_calc_ref_card);
	      m_tab2_calc_tabs.AddToElementsArray(0,m_tab2_calc_ref_base_combo);
	      m_tab2_calc_ref_base_combo.XSize(f_w);
	      m_tab2_calc_ref_base_combo.YSize(sub_control_h);
	      m_tab2_calc_ref_base_combo.BackColor(clrWhite);
	      m_tab2_calc_ref_base_combo.BackColorHover(clrWhite);
	      m_tab2_calc_ref_base_combo.BackColorPressed(clrWhite);
	      m_tab2_calc_ref_base_combo.BorderColor(sub_border);
	      m_tab2_calc_ref_base_combo.BorderColorHover(sub_border);
	      m_tab2_calc_ref_base_combo.BorderColorPressed(sub_border);
	      m_tab2_calc_ref_base_combo.FontSize(10);
	      m_tab2_calc_ref_base_combo.ItemsTotal(ArraySize(ref_items));
	      m_tab2_calc_ref_base_combo.CheckBoxMode(false);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().XSize(sub_btn_w);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().XGap(sub_btn_x);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().YSize(sub_control_h);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().BorderColor(sub_border);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().BorderColorHover(sub_border);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().BorderColorPressed(sub_border);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().IconXGap(sub_btn_w-18);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().LabelXGap(10);
	      m_tab2_calc_ref_base_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(ref_items);i++) m_tab2_calc_ref_base_combo.SetValue(i,ref_items[i]);
	      m_tab2_calc_ref_base_combo.GetListViewPointer().YSize(120);
	      m_tab2_calc_ref_base_combo.GetListViewPointer().LightsHover(true);
	      m_tab2_calc_ref_base_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_calc_ref_base_combo.CreateComboBox("",fpad,ry))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_ref_base_combo);
	      m_tab2_calc_ref_base_combo.SelectItem(0);
	      ry+=sub_control_h+sub_vgap;

	      if(!CreateTextLabel(m_tab2_calc_ref_candle_label,"Candle:",m_tab2_calc_ref_card,m_window_index,m_tab2_calc_tabs,0,fpad,ry,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_ref_candle_label.FontSize(9);
	      m_tab2_calc_ref_candle_label.LabelColor(C'91,78,64');
	      ry+=sub_label_h+2;

	      string candle_items[];
	      ArrayResize(candle_items,4);
	      candle_items[0]="Atual";
	      candle_items[1]="Ultimo";
	      candle_items[2]="Penultimo";
	      candle_items[3]="Antipenultimo";

	      m_tab2_calc_ref_candle_combo.MainPointer(m_tab2_calc_ref_card);
	      m_tab2_calc_tabs.AddToElementsArray(0,m_tab2_calc_ref_candle_combo);
	      m_tab2_calc_ref_candle_combo.XSize(f_w);
	      m_tab2_calc_ref_candle_combo.YSize(sub_control_h);
	      m_tab2_calc_ref_candle_combo.BackColor(clrWhite);
	      m_tab2_calc_ref_candle_combo.BackColorHover(clrWhite);
	      m_tab2_calc_ref_candle_combo.BackColorPressed(clrWhite);
	      m_tab2_calc_ref_candle_combo.BorderColor(sub_border);
	      m_tab2_calc_ref_candle_combo.BorderColorHover(sub_border);
	      m_tab2_calc_ref_candle_combo.BorderColorPressed(sub_border);
	      m_tab2_calc_ref_candle_combo.FontSize(10);
	      m_tab2_calc_ref_candle_combo.ItemsTotal(ArraySize(candle_items));
	      m_tab2_calc_ref_candle_combo.CheckBoxMode(false);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().XSize(sub_btn_w);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().XGap(sub_btn_x);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().YSize(sub_control_h);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().BorderColor(sub_border);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().BorderColorHover(sub_border);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().BorderColorPressed(sub_border);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().IconXGap(sub_btn_w-18);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().LabelXGap(10);
	      m_tab2_calc_ref_candle_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(candle_items);i++) m_tab2_calc_ref_candle_combo.SetValue(i,candle_items[i]);
	      m_tab2_calc_ref_candle_combo.GetListViewPointer().YSize(120);
	      m_tab2_calc_ref_candle_combo.GetListViewPointer().LightsHover(true);
	      m_tab2_calc_ref_candle_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_calc_ref_candle_combo.CreateComboBox("",fpad,ry))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_ref_candle_combo);
	      m_tab2_calc_ref_candle_combo.SelectItem(0);
	      ry+=sub_control_h+sub_vgap;

	      if(!CreateTextLabel(m_tab2_calc_ref_distance_label,"Distancia:",m_tab2_calc_ref_card,m_window_index,m_tab2_calc_tabs,0,fpad,ry,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_ref_distance_label.FontSize(9);
	      m_tab2_calc_ref_distance_label.LabelColor(C'91,78,64');
	      ry+=sub_label_h+2;

	      // SpinEdit - distancia da referencia
	      m_tab2_calc_ref_distance_spin.MainPointer(m_tab2_calc_ref_card);
	      m_tab2_calc_tabs.AddToElementsArray(0,m_tab2_calc_ref_distance_spin);
	      m_tab2_calc_ref_distance_spin.XSize(f_w);
	      m_tab2_calc_ref_distance_spin.MaxValue(100000.0);
	      m_tab2_calc_ref_distance_spin.MinValue(0.0);
	      m_tab2_calc_ref_distance_spin.StepValue(1.0);
	      m_tab2_calc_ref_distance_spin.SetDigits(1);
	      m_tab2_calc_ref_distance_spin.SpinEditMode(true);
	      m_tab2_calc_ref_distance_spin.CheckBoxMode(false);
	      m_tab2_calc_ref_distance_spin.SetValue("0.0");
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().XSize(f_w-34);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().AutoSelectionMode(true);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().XGap(1);
	      if(!m_tab2_calc_ref_distance_spin.CreateTextEdit("",fpad,ry))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_ref_distance_spin);
	      m_tab2_calc_ref_distance_spin.BackColor(sub_back);
	      m_tab2_calc_ref_distance_spin.BackColorHover(sub_back);
	      m_tab2_calc_ref_distance_spin.BackColorPressed(sub_back);
	      m_tab2_calc_ref_distance_spin.BorderColor(sub_border);
	      m_tab2_calc_ref_distance_spin.BorderColorHover(sub_border);
	      m_tab2_calc_ref_distance_spin.BorderColorPressed(sub_border);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().BackColor(clrWhite);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().BackColorHover(clrWhite);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().BorderColor(sub_border);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().BorderColorHover(sub_border);
	      m_tab2_calc_ref_distance_spin.GetTextBoxPointer().BorderColorPressed(sub_border);
	      ry+=sub_control_h+sub_vgap;

	      if(!CreateTextLabel(m_tab2_calc_ref_expire_label,"Expirar:",m_tab2_calc_ref_card,m_window_index,m_tab2_calc_tabs,0,fpad,ry,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_ref_expire_label.FontSize(9);
	      m_tab2_calc_ref_expire_label.LabelColor(C'91,78,64');
	      ry+=sub_label_h+2;

	      string expire_items[];
	      ArrayResize(expire_items,5);
	      expire_items[0]="Nao expirar";
	      expire_items[1]="1 candle";
	      expire_items[2]="2 candles";
	      expire_items[3]="3 candles";
	      expire_items[4]="4 candles";

	      m_tab2_calc_ref_expire_combo.MainPointer(m_tab2_calc_ref_card);
	      m_tab2_calc_tabs.AddToElementsArray(0,m_tab2_calc_ref_expire_combo);
	      m_tab2_calc_ref_expire_combo.XSize(f_w);
	      m_tab2_calc_ref_expire_combo.YSize(sub_control_h);
	      m_tab2_calc_ref_expire_combo.BackColor(clrWhite);
	      m_tab2_calc_ref_expire_combo.BackColorHover(clrWhite);
	      m_tab2_calc_ref_expire_combo.BackColorPressed(clrWhite);
	      m_tab2_calc_ref_expire_combo.BorderColor(sub_border);
	      m_tab2_calc_ref_expire_combo.BorderColorHover(sub_border);
	      m_tab2_calc_ref_expire_combo.BorderColorPressed(sub_border);
	      m_tab2_calc_ref_expire_combo.FontSize(10);
	      m_tab2_calc_ref_expire_combo.ItemsTotal(ArraySize(expire_items));
	      m_tab2_calc_ref_expire_combo.CheckBoxMode(false);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().XSize(sub_btn_w);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().XGap(sub_btn_x);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().YSize(sub_control_h);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().BorderColor(sub_border);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().BorderColorHover(sub_border);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().BorderColorPressed(sub_border);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().IconXGap(sub_btn_w-18);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().LabelXGap(10);
	      m_tab2_calc_ref_expire_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(expire_items);i++) m_tab2_calc_ref_expire_combo.SetValue(i,expire_items[i]);
	      m_tab2_calc_ref_expire_combo.GetListViewPointer().YSize(120);
	      m_tab2_calc_ref_expire_combo.GetListViewPointer().LightsHover(true);
	      m_tab2_calc_ref_expire_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_calc_ref_expire_combo.CreateComboBox("",fpad,ry))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_ref_expire_combo);
	      m_tab2_calc_ref_expire_combo.SelectItem(0);

	      // Media tab controls
	      int my=10;
	      if(!CreateTextLabel(m_tab2_calc_media_candles_label,"Cand. media",m_tab2_calc_media_card,m_window_index,m_tab2_calc_tabs,1,fpad,my,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_media_candles_label.FontSize(9);
	      m_tab2_calc_media_candles_label.LabelColor(C'91,78,64');
	      my+=sub_label_h+2;

	      m_tab2_calc_media_candles_spin.MainPointer(m_tab2_calc_media_card);
	      m_tab2_calc_tabs.AddToElementsArray(1,m_tab2_calc_media_candles_spin);
	      m_tab2_calc_media_candles_spin.XSize(f_w);
	      m_tab2_calc_media_candles_spin.MaxValue(9999.0);
	      m_tab2_calc_media_candles_spin.MinValue(0.0);
	      m_tab2_calc_media_candles_spin.StepValue(1.0);
	      m_tab2_calc_media_candles_spin.SetDigits(0);
	      m_tab2_calc_media_candles_spin.SpinEditMode(true);
	      m_tab2_calc_media_candles_spin.CheckBoxMode(false);
	      m_tab2_calc_media_candles_spin.SetValue("3");
	      m_tab2_calc_media_candles_spin.GetTextBoxPointer().XSize(f_w-34);
	      m_tab2_calc_media_candles_spin.GetTextBoxPointer().AutoSelectionMode(true);
	      m_tab2_calc_media_candles_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_media_candles_spin.GetTextBoxPointer().XGap(1);
	      if(!m_tab2_calc_media_candles_spin.CreateTextEdit("",fpad,my))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_media_candles_spin);
	      m_tab2_calc_media_candles_spin.BackColor(sub_back);
	      m_tab2_calc_media_candles_spin.BackColorHover(sub_back);
	      m_tab2_calc_media_candles_spin.BackColorPressed(sub_back);
	      m_tab2_calc_media_candles_spin.BorderColor(sub_border);
	      m_tab2_calc_media_candles_spin.BorderColorHover(sub_border);
	      m_tab2_calc_media_candles_spin.BorderColorPressed(sub_border);
	      m_tab2_calc_media_candles_spin.GetTextBoxPointer().BackColor(clrWhite);
	      m_tab2_calc_media_candles_spin.GetTextBoxPointer().BorderColor(sub_border);
	      my+=sub_control_h+sub_vgap;

	      if(!CreateTextLabel(m_tab2_calc_media_base_label,"Referencia:",m_tab2_calc_media_card,m_window_index,m_tab2_calc_tabs,1,fpad,my,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_media_base_label.FontSize(9);
	      m_tab2_calc_media_base_label.LabelColor(C'91,78,64');
	      my+=sub_label_h+2;

	      m_tab2_calc_media_base_combo.MainPointer(m_tab2_calc_media_card);
	      m_tab2_calc_tabs.AddToElementsArray(1,m_tab2_calc_media_base_combo);
	      m_tab2_calc_media_base_combo.XSize(f_w);
	      m_tab2_calc_media_base_combo.YSize(sub_control_h);
	      m_tab2_calc_media_base_combo.BackColor(clrWhite);
	      m_tab2_calc_media_base_combo.BackColorHover(clrWhite);
	      m_tab2_calc_media_base_combo.BackColorPressed(clrWhite);
	      m_tab2_calc_media_base_combo.BorderColor(sub_border);
	      m_tab2_calc_media_base_combo.BorderColorHover(sub_border);
	      m_tab2_calc_media_base_combo.BorderColorPressed(sub_border);
	      m_tab2_calc_media_base_combo.FontSize(10);
	      m_tab2_calc_media_base_combo.ItemsTotal(ArraySize(ref_items));
	      m_tab2_calc_media_base_combo.CheckBoxMode(false);
	      m_tab2_calc_media_base_combo.GetButtonPointer().XSize(sub_btn_w);
	      m_tab2_calc_media_base_combo.GetButtonPointer().XGap(sub_btn_x);
	      m_tab2_calc_media_base_combo.GetButtonPointer().YSize(sub_control_h);
	      m_tab2_calc_media_base_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_media_base_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_calc_media_base_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_calc_media_base_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_media_base_combo.GetButtonPointer().BorderColor(sub_border);
	      m_tab2_calc_media_base_combo.GetButtonPointer().BorderColorHover(sub_border);
	      m_tab2_calc_media_base_combo.GetButtonPointer().BorderColorPressed(sub_border);
	      m_tab2_calc_media_base_combo.GetButtonPointer().IconXGap(sub_btn_w-18);
	      m_tab2_calc_media_base_combo.GetButtonPointer().LabelXGap(10);
	      m_tab2_calc_media_base_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(ref_items);i++) m_tab2_calc_media_base_combo.SetValue(i,ref_items[i]);
	      m_tab2_calc_media_base_combo.GetListViewPointer().YSize(120);
	      m_tab2_calc_media_base_combo.GetListViewPointer().LightsHover(true);
	      m_tab2_calc_media_base_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_calc_media_base_combo.CreateComboBox("",fpad,my))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_media_base_combo);
	      m_tab2_calc_media_base_combo.SelectItem(0);
	      my+=sub_control_h+sub_vgap;

	      if(!CreateTextLabel(m_tab2_calc_media_distance_label,"Distancia:",m_tab2_calc_media_card,m_window_index,m_tab2_calc_tabs,1,fpad,my,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_media_distance_label.FontSize(9);
	      m_tab2_calc_media_distance_label.LabelColor(C'91,78,64');
	      my+=sub_label_h+2;

	      m_tab2_calc_media_distance_spin.MainPointer(m_tab2_calc_media_card);
	      m_tab2_calc_tabs.AddToElementsArray(1,m_tab2_calc_media_distance_spin);
	      m_tab2_calc_media_distance_spin.XSize(f_w);
	      m_tab2_calc_media_distance_spin.MaxValue(100000.0);
	      m_tab2_calc_media_distance_spin.MinValue(0.0);
	      m_tab2_calc_media_distance_spin.StepValue(1.0);
	      m_tab2_calc_media_distance_spin.SetDigits(1);
	      m_tab2_calc_media_distance_spin.SpinEditMode(true);
	      m_tab2_calc_media_distance_spin.CheckBoxMode(false);
	      m_tab2_calc_media_distance_spin.SetValue("0.0");
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().XSize(f_w-34);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().AutoSelectionMode(true);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().XGap(1);
	      if(!m_tab2_calc_media_distance_spin.CreateTextEdit("",fpad,my))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_media_distance_spin);
	      m_tab2_calc_media_distance_spin.BackColor(sub_back);
	      m_tab2_calc_media_distance_spin.BackColorHover(sub_back);
	      m_tab2_calc_media_distance_spin.BackColorPressed(sub_back);
	      m_tab2_calc_media_distance_spin.BorderColor(sub_border);
	      m_tab2_calc_media_distance_spin.BorderColorHover(sub_border);
	      m_tab2_calc_media_distance_spin.BorderColorPressed(sub_border);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().BackColor(clrWhite);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().BackColorHover(clrWhite);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().BorderColor(sub_border);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().BorderColorHover(sub_border);
	      m_tab2_calc_media_distance_spin.GetTextBoxPointer().BorderColorPressed(sub_border);
	      my+=sub_control_h+sub_vgap;

	      if(!CreateTextLabel(m_tab2_calc_media_expire_label,"Expirar:",m_tab2_calc_media_card,m_window_index,m_tab2_calc_tabs,1,fpad,my,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_media_expire_label.FontSize(9);
	      m_tab2_calc_media_expire_label.LabelColor(C'91,78,64');
	      my+=sub_label_h+2;

	      string media_expire_items[];
	      ArrayResize(media_expire_items,5);
	      media_expire_items[0]="Nao expirar";
	      media_expire_items[1]="1 candle";
	      media_expire_items[2]="2 candles";
	      media_expire_items[3]="3 candles";
	      media_expire_items[4]="4 candles";

	      m_tab2_calc_media_expire_combo.MainPointer(m_tab2_calc_media_card);
	      m_tab2_calc_tabs.AddToElementsArray(1,m_tab2_calc_media_expire_combo);
	      m_tab2_calc_media_expire_combo.XSize(f_w);
	      m_tab2_calc_media_expire_combo.YSize(sub_control_h);
	      m_tab2_calc_media_expire_combo.BackColor(clrWhite);
	      m_tab2_calc_media_expire_combo.BackColorHover(clrWhite);
	      m_tab2_calc_media_expire_combo.BackColorPressed(clrWhite);
	      m_tab2_calc_media_expire_combo.BorderColor(sub_border);
	      m_tab2_calc_media_expire_combo.BorderColorHover(sub_border);
	      m_tab2_calc_media_expire_combo.BorderColorPressed(sub_border);
	      m_tab2_calc_media_expire_combo.FontSize(10);
	      m_tab2_calc_media_expire_combo.ItemsTotal(ArraySize(media_expire_items));
	      m_tab2_calc_media_expire_combo.CheckBoxMode(false);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().XSize(sub_btn_w);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().XGap(sub_btn_x);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().YSize(sub_control_h);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().BorderColor(sub_border);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().BorderColorHover(sub_border);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().BorderColorPressed(sub_border);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().IconXGap(sub_btn_w-18);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().LabelXGap(10);
	      m_tab2_calc_media_expire_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(media_expire_items);i++) m_tab2_calc_media_expire_combo.SetValue(i,media_expire_items[i]);
	      m_tab2_calc_media_expire_combo.GetListViewPointer().YSize(120);
	      m_tab2_calc_media_expire_combo.GetListViewPointer().LightsHover(true);
	      m_tab2_calc_media_expire_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_calc_media_expire_combo.CreateComboBox("",fpad,my))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_media_expire_combo);
	      m_tab2_calc_media_expire_combo.SelectItem(0);

	      // Max/Min tab controls
	      int maxmin_y=10;
	      if(!CreateTextLabel(m_tab2_calc_maxmin_base_label,"Base:",m_tab2_calc_maxmin_card,m_window_index,m_tab2_calc_tabs,2,fpad,maxmin_y,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_maxmin_base_label.FontSize(9);
	      m_tab2_calc_maxmin_base_label.LabelColor(C'91,78,64');
	      maxmin_y+=sub_label_h+2;

	      string maxmin_items[];
	      ArrayResize(maxmin_items,4);
	      maxmin_items[0]="Maxima";
	      maxmin_items[1]="Minima";
	      maxmin_items[2]="Abertura";
	      maxmin_items[3]="Fechamento";

	      m_tab2_calc_maxmin_base_combo.MainPointer(m_tab2_calc_maxmin_card);
	      m_tab2_calc_tabs.AddToElementsArray(2,m_tab2_calc_maxmin_base_combo);
	      m_tab2_calc_maxmin_base_combo.XSize(f_w);
	      m_tab2_calc_maxmin_base_combo.YSize(sub_control_h);
	      m_tab2_calc_maxmin_base_combo.BackColor(clrWhite);
	      m_tab2_calc_maxmin_base_combo.BackColorHover(clrWhite);
	      m_tab2_calc_maxmin_base_combo.BackColorPressed(clrWhite);
	      m_tab2_calc_maxmin_base_combo.BorderColor(sub_border);
	      m_tab2_calc_maxmin_base_combo.BorderColorHover(sub_border);
	      m_tab2_calc_maxmin_base_combo.BorderColorPressed(sub_border);
	      m_tab2_calc_maxmin_base_combo.FontSize(10);
	      m_tab2_calc_maxmin_base_combo.ItemsTotal(ArraySize(maxmin_items));
	      m_tab2_calc_maxmin_base_combo.CheckBoxMode(false);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().XSize(sub_btn_w);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().XGap(sub_btn_x);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().YSize(sub_control_h);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().BorderColor(sub_border);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().BorderColorHover(sub_border);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().BorderColorPressed(sub_border);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().IconXGap(sub_btn_w-18);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().LabelXGap(10);
	      m_tab2_calc_maxmin_base_combo.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(maxmin_items);i++) m_tab2_calc_maxmin_base_combo.SetValue(i,maxmin_items[i]);
	      m_tab2_calc_maxmin_base_combo.GetListViewPointer().YSize(80);
	      m_tab2_calc_maxmin_base_combo.GetListViewPointer().LightsHover(true);
	      m_tab2_calc_maxmin_base_combo.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_calc_maxmin_base_combo.CreateComboBox("",fpad,maxmin_y))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_maxmin_base_combo);
	      m_tab2_calc_maxmin_base_combo.SelectItem(0);
	      maxmin_y+=sub_control_h+sub_vgap;

	      if(!CreateTextLabel(m_tab2_calc_maxmin_count_label,"Dos ultimos:",m_tab2_calc_maxmin_card,m_window_index,m_tab2_calc_tabs,2,fpad,maxmin_y,f_w,sub_label_h))
	         return(false);
	      m_tab2_calc_maxmin_count_label.FontSize(9);
	      m_tab2_calc_maxmin_count_label.LabelColor(C'91,78,64');
	      maxmin_y+=sub_label_h+2;

	      m_tab2_calc_maxmin_count_spin.MainPointer(m_tab2_calc_maxmin_card);
	      m_tab2_calc_tabs.AddToElementsArray(2,m_tab2_calc_maxmin_count_spin);
	      m_tab2_calc_maxmin_count_spin.XSize(f_w);
	      m_tab2_calc_maxmin_count_spin.MaxValue(9999.0);
	      m_tab2_calc_maxmin_count_spin.MinValue(1.0);
	      m_tab2_calc_maxmin_count_spin.StepValue(1.0);
	      m_tab2_calc_maxmin_count_spin.SetDigits(0);
	      m_tab2_calc_maxmin_count_spin.SpinEditMode(true);
	      m_tab2_calc_maxmin_count_spin.CheckBoxMode(false);
	      m_tab2_calc_maxmin_count_spin.SetValue("3");
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().XSize(f_w-34);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().AutoSelectionMode(true);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().XGap(1);
	      if(!m_tab2_calc_maxmin_count_spin.CreateTextEdit("",fpad,maxmin_y))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_maxmin_count_spin);
	      m_tab2_calc_maxmin_count_spin.BackColor(sub_back);
	      m_tab2_calc_maxmin_count_spin.BackColorHover(sub_back);
	      m_tab2_calc_maxmin_count_spin.BackColorPressed(sub_back);
	      m_tab2_calc_maxmin_count_spin.BorderColor(sub_border);
	      m_tab2_calc_maxmin_count_spin.BorderColorHover(sub_border);
	      m_tab2_calc_maxmin_count_spin.BorderColorPressed(sub_border);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().BackColor(clrWhite);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().BackColorHover(clrWhite);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().BorderColor(sub_border);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().BorderColorHover(sub_border);
	      m_tab2_calc_maxmin_count_spin.GetTextBoxPointer().BorderColorPressed(sub_border);

	      if(!CreateTextLabel(m_tab2_calc_type_label,"Tipo de calculo",m_tabs,m_window_index,m_tabs,1,content_pad,content_y+66,card_w,18))
	         return(false);
	      m_tab2_calc_type_label.FontSize(10);
	      m_tab2_calc_type_label.LabelColor(C'91,78,64');

	      string items_stop_calc[];
	      ArrayResize(items_stop_calc,2);
	      items_stop_calc[0]="Pontos";
	      items_stop_calc[1]="Percentual";

	      m_tab2_calc_type.MainPointer(m_tabs);
	      m_tabs.AddToElementsArray(1,m_tab2_calc_type);
	      m_tab2_calc_type.XSize(260);
	      m_tab2_calc_type.YSize(20);
	      m_tab2_calc_type.BackColor(clrWhite);
	      m_tab2_calc_type.BackColorHover(clrWhite);
	      m_tab2_calc_type.BackColorPressed(clrWhite);
	      m_tab2_calc_type.BorderColor(tab2_border);
	      m_tab2_calc_type.BorderColorHover(tab2_border);
	      m_tab2_calc_type.BorderColorPressed(tab2_border);
	      m_tab2_calc_type.FontSize(10);
	      m_tab2_calc_type.ItemsTotal(ArraySize(items_stop_calc));
	      m_tab2_calc_type.CheckBoxMode(false);
	      m_tab2_calc_type.GetButtonPointer().XGap(1);
	      m_tab2_calc_type.GetButtonPointer().XSize(258);
	      m_tab2_calc_type.GetButtonPointer().YSize(20);
	      m_tab2_calc_type.GetButtonPointer().AnchorRightWindowSide(false);
	      m_tab2_calc_type.GetButtonPointer().BackColor(clrWhite);
	      m_tab2_calc_type.GetButtonPointer().BackColorHover(clrWhite);
	      m_tab2_calc_type.GetButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_calc_type.GetButtonPointer().BorderColor(tab2_border);
	      m_tab2_calc_type.GetButtonPointer().BorderColorHover(tab2_border);
	      m_tab2_calc_type.GetButtonPointer().BorderColorPressed(tab2_border);
	      m_tab2_calc_type.GetButtonPointer().IconXGap(258-18);
	      m_tab2_calc_type.GetButtonPointer().LabelXGap(10);
	      m_tab2_calc_type.GetButtonPointer().LabelColor(C'43,43,43');
	      for(int i=0;i<ArraySize(items_stop_calc);i++) m_tab2_calc_type.SetValue(i,items_stop_calc[i]);
	      m_tab2_calc_type.GetListViewPointer().YSize(80);
	      m_tab2_calc_type.GetListViewPointer().LightsHover(true);
	      m_tab2_calc_type.GetListViewPointer().BackColor(clrWhite);
	      if(!m_tab2_calc_type.CreateComboBox("",content_pad,content_y+88))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_calc_type);
	      m_tab2_calc_type.SelectItem(0);

	      if(!CreateTextLabel(m_tab2_dist_label,"Stop distancia",m_tab2_card_stopfix,m_window_index,m_tabs,1,16,76,tab2_w-32,18))
	         return(false);
	      m_tab2_dist_label.FontSize(10);
	      m_tab2_dist_label.LabelColor(C'91,78,64');

	      const int tab2_dist_w=tab2_w-32;
	      const int tab2_dist_edit_w=tab2_dist_w-34;
	      // Manual creation (avoid default right-anchored textbox that leaves a blank area on the left)
	      m_tab2_dist_spin.MainPointer(m_tab2_card_stopfix);
	      m_tabs.AddToElementsArray(1,m_tab2_dist_spin);
	      m_tab2_dist_spin.XSize(tab2_dist_w);
	      m_tab2_dist_spin.MaxValue(100000.0);
	      m_tab2_dist_spin.MinValue(0.0);
	      m_tab2_dist_spin.StepValue(1.0);
	      m_tab2_dist_spin.SetDigits(1);
	      m_tab2_dist_spin.SpinEditMode(true);
	      m_tab2_dist_spin.CheckBoxMode(false);
	      m_tab2_dist_spin.SetValue("100.0");
	      m_tab2_dist_spin.AnchorBottomWindowSide(false);

	      m_tab2_dist_spin.GetTextBoxPointer().XSize(tab2_dist_edit_w);
	      m_tab2_dist_spin.GetTextBoxPointer().AutoSelectionMode(true);
	      m_tab2_dist_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
	      m_tab2_dist_spin.GetTextBoxPointer().XGap(1);

	      if(!m_tab2_dist_spin.CreateTextEdit("",16,98))
	         return(false);
	      AddToElementsArray(m_window_index,m_tab2_dist_spin);
	      // Blend the control canvas with the card background (avoid the white area at the right)
	      m_tab2_dist_spin.BackColor(C'233,220,203');
	      m_tab2_dist_spin.BackColorHover(C'233,220,203');
	      m_tab2_dist_spin.BackColorPressed(C'233,220,203');
	      m_tab2_dist_spin.BorderColor(tab2_border);
	      m_tab2_dist_spin.BorderColorHover(tab2_border);
	      m_tab2_dist_spin.BorderColorPressed(tab2_border);
	      m_tab2_dist_spin.GetTextBoxPointer().BackColor(clrWhite);
	      m_tab2_dist_spin.GetTextBoxPointer().BackColorHover(clrWhite);
	      m_tab2_dist_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
	      m_tab2_dist_spin.GetTextBoxPointer().BorderColor(tab2_border);
	      m_tab2_dist_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
	      m_tab2_dist_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
	      m_tab2_dist_spin.GetIncButtonPointer().BackColor(clrWhite);
	      m_tab2_dist_spin.GetIncButtonPointer().BackColorHover(clrWhite);
	      m_tab2_dist_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_dist_spin.GetIncButtonPointer().BorderColor(tab2_border);
	      m_tab2_dist_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
	      m_tab2_dist_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
	      m_tab2_dist_spin.GetDecButtonPointer().BackColor(clrWhite);
	      m_tab2_dist_spin.GetDecButtonPointer().BackColorHover(clrWhite);
	      m_tab2_dist_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
	      m_tab2_dist_spin.GetDecButtonPointer().BorderColor(tab2_border);
	      m_tab2_dist_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
	      m_tab2_dist_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

      // Tab 3 (Stop movel) - tipo de calculo + cards
      if(!CreateTextLabel(m_tab3_calc_type_label,"Tipo de calculo",m_tabs,m_window_index,m_tabs,2,content_pad,content_y+66,card_w,18))
         return(false);
      m_tab3_calc_type_label.FontSize(10);
      m_tab3_calc_type_label.LabelColor(C'91,78,64');

      string items_stop_movel_calc[];
      ArrayResize(items_stop_movel_calc,2);
      items_stop_movel_calc[0]="Pontos";
      items_stop_movel_calc[1]="Percentual";

      m_tab3_calc_type.MainPointer(m_tabs);
      m_tabs.AddToElementsArray(2,m_tab3_calc_type);
      m_tab3_calc_type.XSize(260);
      m_tab3_calc_type.YSize(20);
      m_tab3_calc_type.BackColor(clrWhite);
      m_tab3_calc_type.BackColorHover(clrWhite);
      m_tab3_calc_type.BackColorPressed(clrWhite);
      m_tab3_calc_type.BorderColor(tab2_border);
      m_tab3_calc_type.BorderColorHover(tab2_border);
      m_tab3_calc_type.BorderColorPressed(tab2_border);
      m_tab3_calc_type.FontSize(10);
      m_tab3_calc_type.ItemsTotal(ArraySize(items_stop_movel_calc));
      m_tab3_calc_type.CheckBoxMode(false);
      m_tab3_calc_type.GetButtonPointer().XGap(1);
      m_tab3_calc_type.GetButtonPointer().XSize(258);
      m_tab3_calc_type.GetButtonPointer().YSize(20);
      m_tab3_calc_type.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab3_calc_type.GetButtonPointer().BackColor(clrWhite);
      m_tab3_calc_type.GetButtonPointer().BackColorHover(clrWhite);
      m_tab3_calc_type.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab3_calc_type.GetButtonPointer().BorderColor(tab2_border);
      m_tab3_calc_type.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab3_calc_type.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_calc_type.GetButtonPointer().IconXGap(258-18);
      m_tab3_calc_type.GetButtonPointer().LabelXGap(10);
      m_tab3_calc_type.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_stop_movel_calc);i++) m_tab3_calc_type.SetValue(i,items_stop_movel_calc[i]);
      m_tab3_calc_type.GetListViewPointer().YSize(80);
      m_tab3_calc_type.GetListViewPointer().LightsHover(true);
      m_tab3_calc_type.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab3_calc_type.CreateComboBox("",content_pad,content_y+88))
         return(false);
      AddToElementsArray(m_window_index,m_tab3_calc_type);
      m_tab3_calc_type.SelectItem(0);

      const int tab3_x=content_pad;
      const int tab3_y=content_y+120;
      const int tab3_w=card_w;
      const int tab3_h=340;
      if(!CreateFrame(m_tab3_card_padrao,"",m_tabs,m_window_index,m_tabs,2,tab3_x,tab3_y,tab3_w,tab3_h,1))
         return(false);
      m_tab3_card_padrao.BackColor(C'233,220,203');
      m_tab3_card_padrao.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab3_card_padrao_title,"Stop movel (padrao)",m_tab3_card_padrao,m_window_index,m_tabs,2,16,12,tab3_w-32,22))
         return(false);
      m_tab3_card_padrao_title.FontSize(12);
      m_tab3_card_padrao_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab3_use_padrao,"Usar stop movel padrao",m_tab3_card_padrao,m_window_index,m_tabs,2,16,44,tab3_w-32,false,false,false))
         return(false);
      m_tab3_use_padrao.FontSize(10);
      m_tab3_use_padrao.LabelColor(C'43,43,43');

      if(!CreateTextLabel(m_tab3_dist_label,"Distancia para disparo",m_tab3_card_padrao,m_window_index,m_tabs,2,16,76,tab3_w-32,18))
         return(false);
      m_tab3_dist_label.FontSize(10);
      m_tab3_dist_label.LabelColor(C'91,78,64');

      const int tab3_dist_w=tab3_w-32;
      const int tab3_dist_edit_w=tab3_dist_w-34;
      m_tab3_dist_spin.MainPointer(m_tab3_card_padrao);
      m_tabs.AddToElementsArray(2,m_tab3_dist_spin);
      m_tab3_dist_spin.XSize(tab3_dist_w);
      m_tab3_dist_spin.MaxValue(100000.0);
      m_tab3_dist_spin.MinValue(0.0);
      m_tab3_dist_spin.StepValue(1.0);
      m_tab3_dist_spin.SetDigits(0);
      m_tab3_dist_spin.SpinEditMode(true);
      m_tab3_dist_spin.CheckBoxMode(false);
      m_tab3_dist_spin.SetValue("0");
      m_tab3_dist_spin.AnchorBottomWindowSide(false);
      m_tab3_dist_spin.GetTextBoxPointer().XSize(tab3_dist_edit_w);
      m_tab3_dist_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab3_dist_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab3_dist_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab3_dist_spin.CreateTextEdit("",16,98))
         return(false);
      m_tab3_dist_spin.BackColor(C'233,220,203');
      m_tab3_dist_spin.BackColorHover(C'233,220,203');
      m_tab3_dist_spin.BackColorPressed(C'233,220,203');
      m_tab3_dist_spin.BorderColor(tab2_border);
      m_tab3_dist_spin.BorderColorHover(tab2_border);
      m_tab3_dist_spin.BorderColorPressed(tab2_border);
      m_tab3_dist_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab3_dist_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab3_dist_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab3_dist_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab3_dist_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab3_dist_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab3_dist_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab3_dist_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab3_dist_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab3_dist_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab3_dist_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab3_dist_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_dist_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab3_dist_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab3_dist_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab3_dist_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab3_dist_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab3_dist_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);
      AddToElementsArray(m_window_index,m_tab3_dist_spin);

      if(!CreateTextLabel(m_tab3_passo_label,"Passo",m_tab3_card_padrao,m_window_index,m_tabs,2,16,132,tab3_w-32,18))
         return(false);
      m_tab3_passo_label.FontSize(10);
      m_tab3_passo_label.LabelColor(C'91,78,64');

      m_tab3_passo_spin.MainPointer(m_tab3_card_padrao);
      m_tabs.AddToElementsArray(2,m_tab3_passo_spin);
      m_tab3_passo_spin.XSize(tab3_dist_w);
      m_tab3_passo_spin.MaxValue(100000.0);
      m_tab3_passo_spin.MinValue(0.0);
      m_tab3_passo_spin.StepValue(1.0);
      m_tab3_passo_spin.SetDigits(0);
      m_tab3_passo_spin.SpinEditMode(true);
      m_tab3_passo_spin.CheckBoxMode(false);
      m_tab3_passo_spin.SetValue("0");
      m_tab3_passo_spin.AnchorBottomWindowSide(false);
      m_tab3_passo_spin.GetTextBoxPointer().XSize(tab3_dist_edit_w);
      m_tab3_passo_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab3_passo_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab3_passo_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab3_passo_spin.CreateTextEdit("",16,154))
         return(false);
      m_tab3_passo_spin.BackColor(C'233,220,203');
      m_tab3_passo_spin.BackColorHover(C'233,220,203');
      m_tab3_passo_spin.BackColorPressed(C'233,220,203');
      m_tab3_passo_spin.BorderColor(tab2_border);
      m_tab3_passo_spin.BorderColorHover(tab2_border);
      m_tab3_passo_spin.BorderColorPressed(tab2_border);
      m_tab3_passo_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab3_passo_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab3_passo_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab3_passo_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab3_passo_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab3_passo_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab3_passo_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab3_passo_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab3_passo_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab3_passo_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab3_passo_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab3_passo_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_passo_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab3_passo_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab3_passo_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab3_passo_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab3_passo_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab3_passo_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);
      AddToElementsArray(m_window_index,m_tab3_passo_spin);

      const int tab3_candles_card_x=content_pad + card_w + card_gap;
      if(!CreateFrame(m_tab3_card_candles,"",m_tabs,m_window_index,m_tabs,2,tab3_candles_card_x,tab3_y,tab3_w,tab3_h,1))
         return(false);
      m_tab3_card_candles.BackColor(C'233,220,203');
      m_tab3_card_candles.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab3_card_candles_title,"Stop movel (candle a candle)",m_tab3_card_candles,m_window_index,m_tabs,2,16,12,tab3_w-32,22))
         return(false);
      m_tab3_card_candles_title.FontSize(12);
      m_tab3_card_candles_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab3_use_candles,"Candle a Candle",m_tab3_card_candles,m_window_index,m_tabs,2,16,44,tab3_w-32,false,false,false))
         return(false);
      m_tab3_use_candles.FontSize(10);
      m_tab3_use_candles.LabelColor(C'43,43,43');

      const int tab3_cw=tab3_w-32;
      const int tab3_edit_w=tab3_cw-34;
      int tab3_cy=76;

      if(!CreateTextLabel(m_tab3_candles_trigger_label,"Distancia para disparo",m_tab3_card_candles,m_window_index,m_tabs,2,16,tab3_cy,tab3_w-32,18))
         return(false);
      m_tab3_candles_trigger_label.FontSize(10);
      m_tab3_candles_trigger_label.LabelColor(C'91,78,64');
      tab3_cy+=22;

      m_tab3_candles_trigger_spin.MainPointer(m_tab3_card_candles);
      m_tabs.AddToElementsArray(2,m_tab3_candles_trigger_spin);
      m_tab3_candles_trigger_spin.XSize(tab3_cw);
      m_tab3_candles_trigger_spin.MaxValue(100000.0);
      m_tab3_candles_trigger_spin.MinValue(0.0);
      m_tab3_candles_trigger_spin.StepValue(0.1);
      m_tab3_candles_trigger_spin.SetDigits(1);
      m_tab3_candles_trigger_spin.SpinEditMode(true);
      m_tab3_candles_trigger_spin.CheckBoxMode(false);
      m_tab3_candles_trigger_spin.SetValue("1.0");
      m_tab3_candles_trigger_spin.AnchorBottomWindowSide(false);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().XSize(tab3_edit_w);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab3_candles_trigger_spin.CreateTextEdit("",16,tab3_cy))
         return(false);
      m_tab3_candles_trigger_spin.BackColor(C'233,220,203');
      m_tab3_candles_trigger_spin.BackColorHover(C'233,220,203');
      m_tab3_candles_trigger_spin.BackColorPressed(C'233,220,203');
      m_tab3_candles_trigger_spin.BorderColor(tab2_border);
      m_tab3_candles_trigger_spin.BorderColorHover(tab2_border);
      m_tab3_candles_trigger_spin.BorderColorPressed(tab2_border);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab3_candles_trigger_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab3_candles_trigger_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab3_candles_trigger_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab3_candles_trigger_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab3_candles_trigger_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab3_candles_trigger_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab3_candles_trigger_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_candles_trigger_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab3_candles_trigger_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab3_candles_trigger_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab3_candles_trigger_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab3_candles_trigger_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab3_candles_trigger_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);
      AddToElementsArray(m_window_index,m_tab3_candles_trigger_spin);
      tab3_cy+=34;

      if(!CreateTextLabel(m_tab3_candles_pos_label,"Posicao",m_tab3_card_candles,m_window_index,m_tabs,2,16,tab3_cy,tab3_w-32,18))
         return(false);
      m_tab3_candles_pos_label.FontSize(10);
      m_tab3_candles_pos_label.LabelColor(C'91,78,64');
      tab3_cy+=22;

      string tab3_pos_items[];
      ArrayResize(tab3_pos_items,4);
      tab3_pos_items[0]="Maxima";
      tab3_pos_items[1]="Minima";
      tab3_pos_items[2]="Abertura";
      tab3_pos_items[3]="Fechamento";

      m_tab3_candles_pos_combo.MainPointer(m_tab3_card_candles);
      m_tabs.AddToElementsArray(2,m_tab3_candles_pos_combo);
      m_tab3_candles_pos_combo.XSize(tab3_cw);
      m_tab3_candles_pos_combo.YSize(20);
      m_tab3_candles_pos_combo.BackColor(clrWhite);
      m_tab3_candles_pos_combo.BackColorHover(clrWhite);
      m_tab3_candles_pos_combo.BackColorPressed(clrWhite);
      m_tab3_candles_pos_combo.BorderColor(tab2_border);
      m_tab3_candles_pos_combo.BorderColorHover(tab2_border);
      m_tab3_candles_pos_combo.BorderColorPressed(tab2_border);
      m_tab3_candles_pos_combo.FontSize(10);
      m_tab3_candles_pos_combo.ItemsTotal(ArraySize(tab3_pos_items));
      m_tab3_candles_pos_combo.CheckBoxMode(false);
      m_tab3_candles_pos_combo.GetButtonPointer().XGap(1);
      m_tab3_candles_pos_combo.GetButtonPointer().XSize(tab3_cw-2);
      m_tab3_candles_pos_combo.GetButtonPointer().YSize(20);
      m_tab3_candles_pos_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab3_candles_pos_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab3_candles_pos_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab3_candles_pos_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab3_candles_pos_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab3_candles_pos_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab3_candles_pos_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_candles_pos_combo.GetButtonPointer().IconXGap((tab3_cw-2)-18);
      m_tab3_candles_pos_combo.GetButtonPointer().LabelXGap(10);
      m_tab3_candles_pos_combo.GetButtonPointer().LabelColor(C'43,43,43');
      m_tab3_candles_pos_combo.GetListViewPointer().LightsHover(true);
      m_tab3_candles_pos_combo.GetListViewPointer().BackColor(clrWhite);
      for(int i=0;i<ArraySize(tab3_pos_items);i++) m_tab3_candles_pos_combo.SetValue(i,tab3_pos_items[i]);
      if(!m_tab3_candles_pos_combo.CreateComboBox("",16,tab3_cy))
         return(false);
      AddToElementsArray(m_window_index,m_tab3_candles_pos_combo);
      m_tab3_candles_pos_combo.SelectItem(0);
      tab3_cy+=28;

      if(!CreateTextLabel(m_tab3_candles_candle_label,"Candle",m_tab3_card_candles,m_window_index,m_tabs,2,16,tab3_cy,tab3_w-32,18))
         return(false);
      m_tab3_candles_candle_label.FontSize(10);
      m_tab3_candles_candle_label.LabelColor(C'91,78,64');
      tab3_cy+=22;

      string tab3_candle_items[];
      ArrayResize(tab3_candle_items,4);
      tab3_candle_items[0]="Atual";
      tab3_candle_items[1]="Ultimo";
      tab3_candle_items[2]="Penultimo";
      tab3_candle_items[3]="Antipenultimo";

      m_tab3_candles_candle_combo.MainPointer(m_tab3_card_candles);
      m_tabs.AddToElementsArray(2,m_tab3_candles_candle_combo);
      m_tab3_candles_candle_combo.XSize(tab3_cw);
      m_tab3_candles_candle_combo.YSize(20);
      m_tab3_candles_candle_combo.BackColor(clrWhite);
      m_tab3_candles_candle_combo.BackColorHover(clrWhite);
      m_tab3_candles_candle_combo.BackColorPressed(clrWhite);
      m_tab3_candles_candle_combo.BorderColor(tab2_border);
      m_tab3_candles_candle_combo.BorderColorHover(tab2_border);
      m_tab3_candles_candle_combo.BorderColorPressed(tab2_border);
      m_tab3_candles_candle_combo.FontSize(10);
      m_tab3_candles_candle_combo.ItemsTotal(ArraySize(tab3_candle_items));
      m_tab3_candles_candle_combo.CheckBoxMode(false);
      m_tab3_candles_candle_combo.GetButtonPointer().XGap(1);
      m_tab3_candles_candle_combo.GetButtonPointer().XSize(tab3_cw-2);
      m_tab3_candles_candle_combo.GetButtonPointer().YSize(20);
      m_tab3_candles_candle_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab3_candles_candle_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab3_candles_candle_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab3_candles_candle_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab3_candles_candle_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab3_candles_candle_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab3_candles_candle_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_candles_candle_combo.GetButtonPointer().IconXGap((tab3_cw-2)-18);
      m_tab3_candles_candle_combo.GetButtonPointer().LabelXGap(10);
      m_tab3_candles_candle_combo.GetButtonPointer().LabelColor(C'43,43,43');
      m_tab3_candles_candle_combo.GetListViewPointer().LightsHover(true);
      m_tab3_candles_candle_combo.GetListViewPointer().BackColor(clrWhite);
      for(int i=0;i<ArraySize(tab3_candle_items);i++) m_tab3_candles_candle_combo.SetValue(i,tab3_candle_items[i]);
      if(!m_tab3_candles_candle_combo.CreateComboBox("",16,tab3_cy))
         return(false);
      AddToElementsArray(m_window_index,m_tab3_candles_candle_combo);
      m_tab3_candles_candle_combo.SelectItem(0);
      tab3_cy+=28;

      if(!CreateTextLabel(m_tab3_candles_refdist_label,"Distancia da referencia",m_tab3_card_candles,m_window_index,m_tabs,2,16,tab3_cy,tab3_w-32,18))
         return(false);
      m_tab3_candles_refdist_label.FontSize(10);
      m_tab3_candles_refdist_label.LabelColor(C'91,78,64');
      tab3_cy+=22;

      m_tab3_candles_refdist_spin.MainPointer(m_tab3_card_candles);
      m_tabs.AddToElementsArray(2,m_tab3_candles_refdist_spin);
      m_tab3_candles_refdist_spin.XSize(tab3_cw);
      m_tab3_candles_refdist_spin.MaxValue(100000.0);
      m_tab3_candles_refdist_spin.MinValue(0.0);
      m_tab3_candles_refdist_spin.StepValue(0.1);
      m_tab3_candles_refdist_spin.SetDigits(1);
      m_tab3_candles_refdist_spin.SpinEditMode(true);
      m_tab3_candles_refdist_spin.CheckBoxMode(false);
      m_tab3_candles_refdist_spin.SetValue("0.0");
      m_tab3_candles_refdist_spin.AnchorBottomWindowSide(false);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().XSize(tab3_edit_w);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab3_candles_refdist_spin.CreateTextEdit("",16,tab3_cy))
         return(false);
      m_tab3_candles_refdist_spin.BackColor(C'233,220,203');
      m_tab3_candles_refdist_spin.BackColorHover(C'233,220,203');
      m_tab3_candles_refdist_spin.BackColorPressed(C'233,220,203');
      m_tab3_candles_refdist_spin.BorderColor(tab2_border);
      m_tab3_candles_refdist_spin.BorderColorHover(tab2_border);
      m_tab3_candles_refdist_spin.BorderColorPressed(tab2_border);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab3_candles_refdist_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab3_candles_refdist_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab3_candles_refdist_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab3_candles_refdist_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab3_candles_refdist_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab3_candles_refdist_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab3_candles_refdist_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_candles_refdist_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab3_candles_refdist_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab3_candles_refdist_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab3_candles_refdist_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab3_candles_refdist_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab3_candles_refdist_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);
      AddToElementsArray(m_window_index,m_tab3_candles_refdist_spin);

      const int tab3_indic_card_x=content_pad + (card_w + card_gap) * 2;
      if(!CreateFrame(m_tab3_card_indicador,"",m_tabs,m_window_index,m_tabs,2,tab3_indic_card_x,tab3_y,tab3_w,tab3_h,1))
         return(false);
      m_tab3_card_indicador.BackColor(C'233,220,203');
      m_tab3_card_indicador.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab3_card_indicador_title,"Stop movel (indicador)",m_tab3_card_indicador,m_window_index,m_tabs,2,16,12,tab3_w-32,22))
         return(false);
      m_tab3_card_indicador_title.FontSize(12);
      m_tab3_card_indicador_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab3_use_indicador,"Indicador",m_tab3_card_indicador,m_window_index,m_tabs,2,16,44,tab3_w-32,false,false,false))
         return(false);
      m_tab3_use_indicador.FontSize(10);
      m_tab3_use_indicador.LabelColor(C'43,43,43');

      const int tab3_icw=tab3_w-32;
      const int tab3_iedit_w=tab3_icw-34;
      int tab3_iy=76;

      if(!CreateTextLabel(m_tab3_indic_trigger_label,"Distancia para disparo",m_tab3_card_indicador,m_window_index,m_tabs,2,16,tab3_iy,tab3_w-32,18))
         return(false);
      m_tab3_indic_trigger_label.FontSize(10);
      m_tab3_indic_trigger_label.LabelColor(C'91,78,64');
      tab3_iy+=22;

      m_tab3_indic_trigger_spin.MainPointer(m_tab3_card_indicador);
      m_tabs.AddToElementsArray(2,m_tab3_indic_trigger_spin);
      m_tab3_indic_trigger_spin.XSize(tab3_icw);
      m_tab3_indic_trigger_spin.MaxValue(100000.0);
      m_tab3_indic_trigger_spin.MinValue(0.0);
      m_tab3_indic_trigger_spin.StepValue(0.1);
      m_tab3_indic_trigger_spin.SetDigits(1);
      m_tab3_indic_trigger_spin.SpinEditMode(true);
      m_tab3_indic_trigger_spin.CheckBoxMode(false);
      m_tab3_indic_trigger_spin.SetValue("1.0");
      m_tab3_indic_trigger_spin.AnchorBottomWindowSide(false);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().XSize(tab3_iedit_w);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab3_indic_trigger_spin.CreateTextEdit("",16,tab3_iy))
         return(false);
      m_tab3_indic_trigger_spin.BackColor(C'233,220,203');
      m_tab3_indic_trigger_spin.BackColorHover(C'233,220,203');
      m_tab3_indic_trigger_spin.BackColorPressed(C'233,220,203');
      m_tab3_indic_trigger_spin.BorderColor(tab2_border);
      m_tab3_indic_trigger_spin.BorderColorHover(tab2_border);
      m_tab3_indic_trigger_spin.BorderColorPressed(tab2_border);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab3_indic_trigger_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab3_indic_trigger_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab3_indic_trigger_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab3_indic_trigger_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab3_indic_trigger_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab3_indic_trigger_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab3_indic_trigger_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_indic_trigger_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab3_indic_trigger_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab3_indic_trigger_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab3_indic_trigger_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab3_indic_trigger_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab3_indic_trigger_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);
      AddToElementsArray(m_window_index,m_tab3_indic_trigger_spin);
      tab3_iy+=34;

      if(!CreateTextLabel(m_tab3_indic_combo_label,"Indicador",m_tab3_card_indicador,m_window_index,m_tabs,2,16,tab3_iy,tab3_w-32,18))
         return(false);
      m_tab3_indic_combo_label.FontSize(10);
      m_tab3_indic_combo_label.LabelColor(C'91,78,64');
      tab3_iy+=22;

      string tab3_indic_items[];
      ArrayResize(tab3_indic_items,2);
      tab3_indic_items[0]="Media movel";
      tab3_indic_items[1]="Parabolic SAR";

      m_tab3_indic_combo.MainPointer(m_tab3_card_indicador);
      m_tabs.AddToElementsArray(2,m_tab3_indic_combo);
      m_tab3_indic_combo.XSize(tab3_icw);
      m_tab3_indic_combo.YSize(20);
      m_tab3_indic_combo.BackColor(clrWhite);
      m_tab3_indic_combo.BackColorHover(clrWhite);
      m_tab3_indic_combo.BackColorPressed(clrWhite);
      m_tab3_indic_combo.BorderColor(tab2_border);
      m_tab3_indic_combo.BorderColorHover(tab2_border);
      m_tab3_indic_combo.BorderColorPressed(tab2_border);
      m_tab3_indic_combo.FontSize(10);
      m_tab3_indic_combo.ItemsTotal(ArraySize(tab3_indic_items));
      m_tab3_indic_combo.CheckBoxMode(false);
      m_tab3_indic_combo.GetButtonPointer().XGap(1);
      m_tab3_indic_combo.GetButtonPointer().XSize(tab3_icw-2);
      m_tab3_indic_combo.GetButtonPointer().YSize(20);
      m_tab3_indic_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab3_indic_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab3_indic_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab3_indic_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab3_indic_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab3_indic_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab3_indic_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab3_indic_combo.GetButtonPointer().IconXGap((tab3_icw-2)-18);
      m_tab3_indic_combo.GetButtonPointer().LabelXGap(10);
      m_tab3_indic_combo.GetButtonPointer().LabelColor(C'43,43,43');
      m_tab3_indic_combo.GetListViewPointer().LightsHover(true);
      m_tab3_indic_combo.GetListViewPointer().BackColor(clrWhite);
      for(int i=0;i<ArraySize(tab3_indic_items);i++) m_tab3_indic_combo.SetValue(i,tab3_indic_items[i]);
      if(!m_tab3_indic_combo.CreateComboBox("",16,tab3_iy))
         return(false);
      AddToElementsArray(m_window_index,m_tab3_indic_combo);
      m_tab3_indic_combo.SelectItem(0);

      // Tab 4 (Take profit) - combo + first fixed card
      if(!CreateTextLabel(m_tab4_calc_type_label,"Tipo de calculo",m_tabs,m_window_index,m_tabs,3,content_pad,content_y+66,card_w,18))
         return(false);
      m_tab4_calc_type_label.FontSize(10);
      m_tab4_calc_type_label.LabelColor(C'91,78,64');

      string items_take_calc[];
      ArrayResize(items_take_calc,2);
      items_take_calc[0]="Pontos";
      items_take_calc[1]="Percentual";

      m_tab4_calc_type.MainPointer(m_tabs);
      m_tabs.AddToElementsArray(3,m_tab4_calc_type);
      m_tab4_calc_type.XSize(260);
      m_tab4_calc_type.YSize(20);
      m_tab4_calc_type.BackColor(clrWhite);
      m_tab4_calc_type.BackColorHover(clrWhite);
      m_tab4_calc_type.BackColorPressed(clrWhite);
      m_tab4_calc_type.BorderColor(tab2_border);
      m_tab4_calc_type.BorderColorHover(tab2_border);
      m_tab4_calc_type.BorderColorPressed(tab2_border);
      m_tab4_calc_type.FontSize(10);
      m_tab4_calc_type.ItemsTotal(ArraySize(items_take_calc));
      m_tab4_calc_type.CheckBoxMode(false);
      m_tab4_calc_type.GetButtonPointer().XGap(1);
      m_tab4_calc_type.GetButtonPointer().XSize(258);
      m_tab4_calc_type.GetButtonPointer().YSize(20);
      m_tab4_calc_type.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_calc_type.GetButtonPointer().BackColor(clrWhite);
      m_tab4_calc_type.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_calc_type.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_calc_type.GetButtonPointer().BorderColor(tab2_border);
      m_tab4_calc_type.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab4_calc_type.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab4_calc_type.GetButtonPointer().IconXGap(258-18);
      m_tab4_calc_type.GetButtonPointer().LabelXGap(10);
      m_tab4_calc_type.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_take_calc);i++) m_tab4_calc_type.SetValue(i,items_take_calc[i]);
      m_tab4_calc_type.GetListViewPointer().YSize(80);
      m_tab4_calc_type.GetListViewPointer().LightsHover(true);
      m_tab4_calc_type.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_calc_type.CreateComboBox("",content_pad,content_y+88))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_type);
      m_tab4_calc_type.SelectItem(0);

      const int tab4_x=content_pad;
      const int tab4_y=content_y+120;
      // Fit 4 cards side-by-side in the available content width
      const int tab4_w=(tabs_w-(content_pad*2)-(card_gap*3))/4;
      const int tab4_h=356;
      if(!CreateFrame(m_tab4_card_takefix,"",m_tabs,m_window_index,m_tabs,3,tab4_x,tab4_y,tab4_w,tab4_h,1))
         return(false);
      m_tab4_card_takefix.BackColor(C'233,220,203');
      m_tab4_card_takefix.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab4_card_takefix_title,"Take profit (fixo)",m_tab4_card_takefix,m_window_index,m_tabs,3,16,12,tab4_w-32,22))
         return(false);
      m_tab4_card_takefix_title.FontSize(12);
      m_tab4_card_takefix_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab4_use_fixed,"Usar take profit fixo",m_tab4_card_takefix,m_window_index,m_tabs,3,16,44,tab4_w-32,false,false,false))
         return(false);
      m_tab4_use_fixed.FontSize(10);
      m_tab4_use_fixed.LabelColor(C'43,43,43');

      if(!CreateTextLabel(m_tab4_dist_label,"Take distancia",m_tab4_card_takefix,m_window_index,m_tabs,3,16,76,tab4_w-32,18))
         return(false);
      m_tab4_dist_label.FontSize(10);
      m_tab4_dist_label.LabelColor(C'91,78,64');

      const int tab4_dist_w=tab4_w-32;
      const int tab4_dist_edit_w=tab4_dist_w-34;
      m_tab4_dist_spin.MainPointer(m_tab4_card_takefix);
      m_tabs.AddToElementsArray(3,m_tab4_dist_spin);
      m_tab4_dist_spin.XSize(tab4_dist_w);
      m_tab4_dist_spin.MaxValue(100000.0);
      m_tab4_dist_spin.MinValue(0.0);
      m_tab4_dist_spin.StepValue(1.0);
      m_tab4_dist_spin.SetDigits(1);
      m_tab4_dist_spin.SpinEditMode(true);
      m_tab4_dist_spin.CheckBoxMode(false);
      m_tab4_dist_spin.SetValue("100.0");
      m_tab4_dist_spin.AnchorBottomWindowSide(false);
      m_tab4_dist_spin.GetTextBoxPointer().XSize(tab4_dist_edit_w);
      m_tab4_dist_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab4_dist_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab4_dist_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab4_dist_spin.CreateTextEdit("",16,98))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_dist_spin);
      m_tab4_dist_spin.BackColor(C'233,220,203');
      m_tab4_dist_spin.BackColorHover(C'233,220,203');
      m_tab4_dist_spin.BackColorPressed(C'233,220,203');
      m_tab4_dist_spin.BorderColor(tab2_border);
      m_tab4_dist_spin.BorderColorHover(tab2_border);
      m_tab4_dist_spin.BorderColorPressed(tab2_border);
      m_tab4_dist_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab4_dist_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab4_dist_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab4_dist_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab4_dist_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab4_dist_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab4_dist_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab4_dist_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab4_dist_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab4_dist_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab4_dist_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab4_dist_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab4_dist_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab4_dist_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab4_dist_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab4_dist_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab4_dist_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab4_dist_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

      // Tab 4: Take profit (calculo) card
      const int tab4_calc_card_x=content_pad + (tab4_w + card_gap);
      if(!CreateFrame(m_tab4_card_calc,"",m_tabs,m_window_index,m_tabs,3,tab4_calc_card_x,tab4_y,tab4_w,tab4_h,1))
         return(false);
      m_tab4_card_calc.BackColor(C'233,220,203');
      m_tab4_card_calc.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab4_card_calc_title,"Take profit (calculo)",m_tab4_card_calc,m_window_index,m_tabs,3,16,12,tab4_w-32,22))
         return(false);
      m_tab4_card_calc_title.FontSize(12);
      m_tab4_card_calc_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab4_use_calc,"Usar calculo",m_tab4_card_calc,m_window_index,m_tabs,3,16,34,tab4_w-32,true,false,false))
         return(false);
      m_tab4_use_calc.FontSize(10);
      m_tab4_use_calc.LabelColor(C'43,43,43');

      // Tab 4: Take profit (multiplicador) card (espelho do Stop loss mult)
      const int tab4_mult_card_x=content_pad + (tab4_w + card_gap) * 2;
      if(!CreateFrame(m_tab4_card_mult,"",m_tabs,m_window_index,m_tabs,3,tab4_mult_card_x,tab4_y,tab4_w,tab4_h,1))
         return(false);
      m_tab4_card_mult.BackColor(C'233,220,203');
      m_tab4_card_mult.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab4_card_mult_title,"Take profit (multiplicador)",m_tab4_card_mult,m_window_index,m_tabs,3,16,12,tab4_w-32,22))
         return(false);
      m_tab4_card_mult_title.FontSize(12);
      m_tab4_card_mult_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab4_use_mult,"Usar multiplicador",m_tab4_card_mult,m_window_index,m_tabs,3,16,34,tab4_w-32,false,false,false))
         return(false);
      m_tab4_use_mult.FontSize(10);
      m_tab4_use_mult.LabelColor(C'43,43,43');

      const int tab4_mult_pad=16;
      const int tab4_mult_w=tab4_w-32;
      int tab4_mult_y=66;

      if(!CreateTextLabel(m_tab4_mult_base_label,"Base:",m_tab4_card_mult,m_window_index,m_tabs,3,tab4_mult_pad,tab4_mult_y,tab4_mult_w,18))
         return(false);
      m_tab4_mult_base_label.FontSize(10);
      m_tab4_mult_base_label.LabelColor(C'91,78,64');
      tab4_mult_y+=22;

      string tab4_mult_base_items[];
      ArrayResize(tab4_mult_base_items,2);
      tab4_mult_base_items[0]="Corpo do candle";
      tab4_mult_base_items[1]="Range (pavio a pavio)";

      m_tab4_mult_base_combo.MainPointer(m_tab4_card_mult);
      m_tabs.AddToElementsArray(3,m_tab4_mult_base_combo);
      m_tab4_mult_base_combo.XSize(tab4_mult_w);
      m_tab4_mult_base_combo.YSize(20);
      m_tab4_mult_base_combo.BackColor(clrWhite);
      m_tab4_mult_base_combo.BackColorHover(clrWhite);
      m_tab4_mult_base_combo.BackColorPressed(clrWhite);
      m_tab4_mult_base_combo.BorderColor(tab2_border);
      m_tab4_mult_base_combo.BorderColorHover(tab2_border);
      m_tab4_mult_base_combo.BorderColorPressed(tab2_border);
      m_tab4_mult_base_combo.FontSize(10);
      m_tab4_mult_base_combo.ItemsTotal(ArraySize(tab4_mult_base_items));
      m_tab4_mult_base_combo.CheckBoxMode(false);
      m_tab4_mult_base_combo.GetButtonPointer().XGap(1);
      m_tab4_mult_base_combo.GetButtonPointer().XSize(tab4_mult_w-2);
      m_tab4_mult_base_combo.GetButtonPointer().YSize(20);
      m_tab4_mult_base_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_mult_base_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_mult_base_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_mult_base_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_mult_base_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab4_mult_base_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab4_mult_base_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab4_mult_base_combo.GetButtonPointer().IconXGap((tab4_mult_w-2)-18);
      m_tab4_mult_base_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_mult_base_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(tab4_mult_base_items);i++) m_tab4_mult_base_combo.SetValue(i,tab4_mult_base_items[i]);
      m_tab4_mult_base_combo.GetListViewPointer().YSize(80);
      m_tab4_mult_base_combo.GetListViewPointer().LightsHover(true);
      m_tab4_mult_base_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_mult_base_combo.CreateComboBox("",tab4_mult_pad,tab4_mult_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_mult_base_combo);
      m_tab4_mult_base_combo.SelectItem(0);
      tab4_mult_y+=22+10;

      if(!CreateTextLabel(m_tab4_mult_candle_label,"Candle:",m_tab4_card_mult,m_window_index,m_tabs,3,tab4_mult_pad,tab4_mult_y,tab4_mult_w,18))
         return(false);
      m_tab4_mult_candle_label.FontSize(10);
      m_tab4_mult_candle_label.LabelColor(C'91,78,64');
      tab4_mult_y+=22;

      string tab4_mult_candle_items[];
      ArrayResize(tab4_mult_candle_items,4);
      tab4_mult_candle_items[0]="Atual";
      tab4_mult_candle_items[1]="Ultimo";
      tab4_mult_candle_items[2]="Penultimo";
      tab4_mult_candle_items[3]="Antipenultimo";

      m_tab4_mult_candle_combo.MainPointer(m_tab4_card_mult);
      m_tabs.AddToElementsArray(3,m_tab4_mult_candle_combo);
      m_tab4_mult_candle_combo.XSize(tab4_mult_w);
      m_tab4_mult_candle_combo.YSize(20);
      m_tab4_mult_candle_combo.BackColor(clrWhite);
      m_tab4_mult_candle_combo.BackColorHover(clrWhite);
      m_tab4_mult_candle_combo.BackColorPressed(clrWhite);
      m_tab4_mult_candle_combo.BorderColor(tab2_border);
      m_tab4_mult_candle_combo.BorderColorHover(tab2_border);
      m_tab4_mult_candle_combo.BorderColorPressed(tab2_border);
      m_tab4_mult_candle_combo.FontSize(10);
      m_tab4_mult_candle_combo.ItemsTotal(ArraySize(tab4_mult_candle_items));
      m_tab4_mult_candle_combo.CheckBoxMode(false);
      m_tab4_mult_candle_combo.GetButtonPointer().XGap(1);
      m_tab4_mult_candle_combo.GetButtonPointer().XSize(tab4_mult_w-2);
      m_tab4_mult_candle_combo.GetButtonPointer().YSize(20);
      m_tab4_mult_candle_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_mult_candle_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_mult_candle_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_mult_candle_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_mult_candle_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab4_mult_candle_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab4_mult_candle_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab4_mult_candle_combo.GetButtonPointer().IconXGap((tab4_mult_w-2)-18);
      m_tab4_mult_candle_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_mult_candle_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(tab4_mult_candle_items);i++) m_tab4_mult_candle_combo.SetValue(i,tab4_mult_candle_items[i]);
      m_tab4_mult_candle_combo.GetListViewPointer().YSize(120);
      m_tab4_mult_candle_combo.GetListViewPointer().LightsHover(true);
      m_tab4_mult_candle_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_mult_candle_combo.CreateComboBox("",tab4_mult_pad,tab4_mult_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_mult_candle_combo);
      m_tab4_mult_candle_combo.SelectItem(0);
      tab4_mult_y+=22+10;

      if(!CreateTextLabel(m_tab4_mult_qty_label,"Multiplicador:",m_tab4_card_mult,m_window_index,m_tabs,3,tab4_mult_pad,tab4_mult_y,tab4_mult_w,18))
         return(false);
      m_tab4_mult_qty_label.FontSize(10);
      m_tab4_mult_qty_label.LabelColor(C'91,78,64');
      tab4_mult_y+=22;

      const int tab4_mult_edit_w=tab4_mult_w-34;
      m_tab4_mult_qty_spin.MainPointer(m_tab4_card_mult);
      m_tabs.AddToElementsArray(3,m_tab4_mult_qty_spin);
      m_tab4_mult_qty_spin.XSize(tab4_mult_w);
      m_tab4_mult_qty_spin.MaxValue(100000.0);
      m_tab4_mult_qty_spin.MinValue(0.0);
      m_tab4_mult_qty_spin.StepValue(0.1);
      m_tab4_mult_qty_spin.SetDigits(1);
      m_tab4_mult_qty_spin.SpinEditMode(true);
      m_tab4_mult_qty_spin.CheckBoxMode(false);
      m_tab4_mult_qty_spin.SetValue("1.0");
      m_tab4_mult_qty_spin.AnchorBottomWindowSide(false);
      m_tab4_mult_qty_spin.GetTextBoxPointer().XSize(tab4_mult_edit_w);
      m_tab4_mult_qty_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab4_mult_qty_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab4_mult_qty_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab4_mult_qty_spin.CreateTextEdit("",tab4_mult_pad,tab4_mult_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_mult_qty_spin);
      m_tab4_mult_qty_spin.BackColor(C'233,220,203');
      m_tab4_mult_qty_spin.BackColorHover(C'233,220,203');
      m_tab4_mult_qty_spin.BackColorPressed(C'233,220,203');
      m_tab4_mult_qty_spin.BorderColor(tab2_border);
      m_tab4_mult_qty_spin.BorderColorHover(tab2_border);
      m_tab4_mult_qty_spin.BorderColorPressed(tab2_border);
      m_tab4_mult_qty_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab4_mult_qty_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab4_mult_qty_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab4_mult_qty_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab4_mult_qty_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab4_mult_qty_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab4_mult_qty_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab4_mult_qty_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab4_mult_qty_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab4_mult_qty_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab4_mult_qty_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab4_mult_qty_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab4_mult_qty_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab4_mult_qty_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab4_mult_qty_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab4_mult_qty_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab4_mult_qty_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab4_mult_qty_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

      // Tab 4: Take profit (indicador) card (espelho do Stop movel indicador)
      const int tab4_indic_x=content_pad + (tab4_w + card_gap) * 3;
      const int tab4_indic_y=tab4_y;
      const int tab4_indic_w=tab4_w;
      const int tab4_indic_h=tab4_h;
      if(!CreateFrame(m_tab4_card_indicador,"",m_tabs,m_window_index,m_tabs,3,tab4_indic_x,tab4_indic_y,tab4_indic_w,tab4_indic_h,1))
         return(false);
      m_tab4_card_indicador.BackColor(C'233,220,203');
      m_tab4_card_indicador.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab4_card_indicador_title,"Take profit (indicador)",m_tab4_card_indicador,m_window_index,m_tabs,3,16,12,tab4_indic_w-32,22))
         return(false);
      m_tab4_card_indicador_title.FontSize(12);
      m_tab4_card_indicador_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab4_use_indicador,"Indicador",m_tab4_card_indicador,m_window_index,m_tabs,3,16,44,tab4_indic_w-32,false,false,false))
         return(false);
      m_tab4_use_indicador.FontSize(10);
      m_tab4_use_indicador.LabelColor(C'43,43,43');

      int tab4_iy=76;
      if(!CreateTextLabel(m_tab4_indic_trigger_label,"Distancia para disparo",m_tab4_card_indicador,m_window_index,m_tabs,3,16,tab4_iy,tab4_indic_w-32,18))
         return(false);
      m_tab4_indic_trigger_label.FontSize(10);
      m_tab4_indic_trigger_label.LabelColor(C'91,78,64');
      tab4_iy+=22;

      const int tab4_trigger_w=tab4_indic_w-32;
      const int tab4_trigger_edit_w=tab4_trigger_w-34;
      m_tab4_indic_trigger_spin.MainPointer(m_tab4_card_indicador);
      m_tabs.AddToElementsArray(3,m_tab4_indic_trigger_spin);
      m_tab4_indic_trigger_spin.XSize(tab4_trigger_w);
      m_tab4_indic_trigger_spin.MaxValue(100000.0);
      m_tab4_indic_trigger_spin.MinValue(0.0);
      m_tab4_indic_trigger_spin.StepValue(1.0);
      m_tab4_indic_trigger_spin.SetDigits(1);
      m_tab4_indic_trigger_spin.SpinEditMode(true);
      m_tab4_indic_trigger_spin.CheckBoxMode(false);
      m_tab4_indic_trigger_spin.SetValue("0.0");
      m_tab4_indic_trigger_spin.AnchorBottomWindowSide(false);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().XSize(tab4_trigger_edit_w);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab4_indic_trigger_spin.CreateTextEdit("",16,tab4_iy))
         return(false);
      m_tab4_indic_trigger_spin.BackColor(C'233,220,203');
      m_tab4_indic_trigger_spin.BackColorHover(C'233,220,203');
      m_tab4_indic_trigger_spin.BackColorPressed(C'233,220,203');
      m_tab4_indic_trigger_spin.BorderColor(tab2_border);
      m_tab4_indic_trigger_spin.BorderColorHover(tab2_border);
      m_tab4_indic_trigger_spin.BorderColorPressed(tab2_border);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab4_indic_trigger_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab4_indic_trigger_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab4_indic_trigger_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab4_indic_trigger_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab4_indic_trigger_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab4_indic_trigger_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab4_indic_trigger_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab4_indic_trigger_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab4_indic_trigger_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab4_indic_trigger_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab4_indic_trigger_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab4_indic_trigger_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab4_indic_trigger_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);
      AddToElementsArray(m_window_index,m_tab4_indic_trigger_spin);
      tab4_iy+=34;

      if(!CreateTextLabel(m_tab4_indic_combo_label,"Indicador",m_tab4_card_indicador,m_window_index,m_tabs,3,16,tab4_iy,tab4_indic_w-32,18))
         return(false);
      m_tab4_indic_combo_label.FontSize(10);
      m_tab4_indic_combo_label.LabelColor(C'91,78,64');
      tab4_iy+=22;

      string tab4_indic_items[];
      ArrayResize(tab4_indic_items,2);
      tab4_indic_items[0]="Media movel";
      tab4_indic_items[1]="Parabolic SAR";

      m_tab4_indic_combo.MainPointer(m_tab4_card_indicador);
      m_tabs.AddToElementsArray(3,m_tab4_indic_combo);
      m_tab4_indic_combo.XSize(tab4_trigger_w);
      m_tab4_indic_combo.YSize(20);
      m_tab4_indic_combo.BackColor(clrWhite);
      m_tab4_indic_combo.BackColorHover(clrWhite);
      m_tab4_indic_combo.BackColorPressed(clrWhite);
      m_tab4_indic_combo.BorderColor(tab2_border);
      m_tab4_indic_combo.BorderColorHover(tab2_border);
      m_tab4_indic_combo.BorderColorPressed(tab2_border);
      m_tab4_indic_combo.FontSize(10);
      m_tab4_indic_combo.ItemsTotal(ArraySize(tab4_indic_items));
      m_tab4_indic_combo.CheckBoxMode(false);
      m_tab4_indic_combo.GetButtonPointer().XGap(1);
      m_tab4_indic_combo.GetButtonPointer().XSize(tab4_trigger_w-2);
      m_tab4_indic_combo.GetButtonPointer().YSize(20);
      m_tab4_indic_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_indic_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_indic_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_indic_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_indic_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab4_indic_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab4_indic_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab4_indic_combo.GetButtonPointer().IconXGap((tab4_trigger_w-2)-18);
      m_tab4_indic_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_indic_combo.GetButtonPointer().LabelColor(C'43,43,43');
      m_tab4_indic_combo.GetListViewPointer().LightsHover(true);
      m_tab4_indic_combo.GetListViewPointer().BackColor(clrWhite);
      for(int i=0;i<ArraySize(tab4_indic_items);i++) m_tab4_indic_combo.SetValue(i,tab4_indic_items[i]);
      if(!m_tab4_indic_combo.CreateComboBox("",16,tab4_iy))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_indic_combo);
      m_tab4_indic_combo.SelectItem(0);

      // Tabs inside "Take profit (calculo)"
      const int tab4_calc_tabs_x=16;
      const int tab4_calc_tabs_y=82;
      const int tab4_calc_tabs_w=tab4_w-32;
      const int tab4_calc_tabs_h=tab4_h-90;
      const int tab4_calc_tab_h=22;

      string tab4_calc_tab_text[];
      int tab4_calc_tab_widths[];
      ArrayResize(tab4_calc_tab_text,3);
      ArrayResize(tab4_calc_tab_widths,3);
      tab4_calc_tab_text[0]="Ref.";
      tab4_calc_tab_text[1]="Med.";
      tab4_calc_tab_text[2]="Max/Min";
      tab4_calc_tab_widths[0]=74;
      tab4_calc_tab_widths[1]=64;
      tab4_calc_tab_widths[2]=82;

      m_tab4_calc_tabs.MainPointer(m_tab4_card_calc);
      m_tabs.AddToElementsArray(3,m_tab4_calc_tabs);
      m_tab4_calc_tabs.XSize(tab4_calc_tabs_w);
      m_tab4_calc_tabs.YSize(tab4_calc_tabs_h);
      m_tab4_calc_tabs.IsCenterText(true);
      m_tab4_calc_tabs.PositionMode(TABS_TOP);
      m_tab4_calc_tabs.TabsYSize(tab4_calc_tab_h);
      m_tab4_calc_tabs.AutoXResizeMode(false);
      m_tab4_calc_tabs.AutoYResizeMode(false);
      m_tab4_calc_tabs.BackColorPressed(C'233,220,203');
      m_tab4_calc_tabs.BorderColor(C'197,168,136');
      m_tab4_calc_tabs.BorderColorHover(C'197,168,136');
      m_tab4_calc_tabs.BorderColorPressed(C'197,168,136');

      for(int i=0; i<3; i++)
         m_tab4_calc_tabs.AddTab(tab4_calc_tab_text[i],tab4_calc_tab_widths[i]);

      if(!m_tab4_calc_tabs.CreateTabs(tab4_calc_tabs_x,tab4_calc_tabs_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_tabs);

      CEF_CButtonsGroup *calc_bg_tp=m_tab4_calc_tabs.GetButtonsGroupPointer();
      if(calc_bg_tp!=NULL)
        {
         for(int i=0; i<3; i++)
           {
            calc_bg_tp.GetButtonPointer(i).FontSize(8);
            calc_bg_tp.GetButtonPointer(i).BackColor(C'39,54,78');
            calc_bg_tp.GetButtonPointer(i).BackColorHover(C'62,79,101');
            calc_bg_tp.GetButtonPointer(i).BackColorPressed(C'226,114,64');
            calc_bg_tp.GetButtonPointer(i).BorderColor(C'18,29,43');
            calc_bg_tp.GetButtonPointer(i).BorderColorHover(C'62,79,101');
            calc_bg_tp.GetButtonPointer(i).BorderColorPressed(C'240,140,86');
            calc_bg_tp.GetButtonPointer(i).LabelColor(clrWhite);
            calc_bg_tp.GetButtonPointer(i).LabelColorHover(clrWhite);
            calc_bg_tp.GetButtonPointer(i).LabelColorPressed(clrWhite);
           }
        }

      const int tab4_calc_content_x=12;
      const int tab4_calc_content_y=6;
      const int tab4_calc_content_w=tab4_calc_tabs_w-(tab4_calc_content_x*2);

      if(!CreateCheckbox(m_tab4_calc_ref_check,"Referencia",m_tab4_calc_tabs,m_window_index,m_tab4_calc_tabs,0,tab4_calc_content_x,tab4_calc_content_y,140,false,false,false))
         return(false);
      m_tab4_calc_ref_check.FontSize(10);
      m_tab4_calc_ref_check.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab4_calc_media_check,"Media",m_tab4_calc_tabs,m_window_index,m_tab4_calc_tabs,1,tab4_calc_content_x,tab4_calc_content_y,140,false,false,false))
         return(false);
      m_tab4_calc_media_check.FontSize(10);
      m_tab4_calc_media_check.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab4_calc_maxmin_check,"Max/Min",m_tab4_calc_tabs,m_window_index,m_tab4_calc_tabs,2,tab4_calc_content_x,tab4_calc_content_y,140,false,false,false))
         return(false);
      m_tab4_calc_maxmin_check.FontSize(10);
      m_tab4_calc_maxmin_check.LabelColor(C'43,43,43');

      // Sub-cards for Tab 4 Calc
      const int tab4_subcard_x=tab4_calc_content_x;
      const int tab4_subcard_y=tab4_calc_content_y+18;
      const int tab4_subcard_w=tab4_calc_content_w;
      const int tab4_subcard_h=tab4_calc_tabs_h - tab4_subcard_y - 18;
      const color tab4_sub_back=C'239,231,218';
      const color tab4_sub_border=C'197,168,136';

      if(!CreateFrame(m_tab4_calc_ref_card,"",m_tab4_calc_tabs,m_window_index,m_tab4_calc_tabs,0,tab4_subcard_x,tab4_subcard_y,tab4_subcard_w,tab4_subcard_h,1))
         return(false);
      m_tab4_calc_ref_card.BackColor(tab4_sub_back);
      m_tab4_calc_ref_card.BorderColor(tab4_sub_border);

      if(!CreateFrame(m_tab4_calc_media_card,"",m_tab4_calc_tabs,m_window_index,m_tab4_calc_tabs,1,tab4_subcard_x,tab4_subcard_y,tab4_subcard_w,tab4_subcard_h,1))
         return(false);
      m_tab4_calc_media_card.BackColor(tab4_sub_back);
      m_tab4_calc_media_card.BorderColor(tab4_sub_border);

      if(!CreateFrame(m_tab4_calc_maxmin_card,"",m_tab4_calc_tabs,m_window_index,m_tab4_calc_tabs,2,tab4_subcard_x,tab4_subcard_y,tab4_subcard_w,tab4_subcard_h,1))
         return(false);
      m_tab4_calc_maxmin_card.BackColor(tab4_sub_back);
      m_tab4_calc_maxmin_card.BorderColor(tab4_sub_border);

      // Reference tab controls - Tab 4
      const int tab4_fpad=12;
      const int tab4_f_w=tab4_subcard_w-(tab4_fpad*2);
      const int tab4_sub_label_h=16;
      const int tab4_sub_control_h=20;
      const int tab4_sub_vgap=8;
      const int tab4_sub_btn_w=tab4_f_w-2;
      const int tab4_sub_btn_x=1;
      int tab4_ry=10;

      if(!CreateTextLabel(m_tab4_calc_ref_base_label,"Referencia:",m_tab4_calc_ref_card,m_window_index,m_tab4_calc_tabs,0,tab4_fpad,tab4_ry,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_ref_base_label.FontSize(9);
      m_tab4_calc_ref_base_label.LabelColor(C'91,78,64');
      tab4_ry+=tab4_sub_label_h+2;

      string tab4_ref_items[];
      ArrayResize(tab4_ref_items,4);
      tab4_ref_items[0]="Maxima";
      tab4_ref_items[1]="Minima";
      tab4_ref_items[2]="Abertura";
      tab4_ref_items[3]="Fechamento";

      m_tab4_calc_ref_base_combo.MainPointer(m_tab4_calc_ref_card);
      m_tab4_calc_tabs.AddToElementsArray(0,m_tab4_calc_ref_base_combo);
      m_tab4_calc_ref_base_combo.XSize(tab4_f_w);
      m_tab4_calc_ref_base_combo.YSize(tab4_sub_control_h);
      m_tab4_calc_ref_base_combo.BackColor(clrWhite);
      m_tab4_calc_ref_base_combo.BackColorHover(clrWhite);
      m_tab4_calc_ref_base_combo.BackColorPressed(clrWhite);
      m_tab4_calc_ref_base_combo.BorderColor(tab4_sub_border);
      m_tab4_calc_ref_base_combo.BorderColorHover(tab4_sub_border);
      m_tab4_calc_ref_base_combo.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_ref_base_combo.FontSize(10);
      m_tab4_calc_ref_base_combo.ItemsTotal(ArraySize(tab4_ref_items));
      m_tab4_calc_ref_base_combo.CheckBoxMode(false);
      m_tab4_calc_ref_base_combo.GetButtonPointer().XSize(tab4_sub_btn_w);
      m_tab4_calc_ref_base_combo.GetButtonPointer().XGap(tab4_sub_btn_x);
      m_tab4_calc_ref_base_combo.GetButtonPointer().YSize(tab4_sub_control_h);
      m_tab4_calc_ref_base_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_calc_ref_base_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_calc_ref_base_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_calc_ref_base_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_calc_ref_base_combo.GetButtonPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_ref_base_combo.GetButtonPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_ref_base_combo.GetButtonPointer().BorderColorPressed(tab4_sub_border);
      m_tab4_calc_ref_base_combo.GetButtonPointer().IconXGap(tab4_sub_btn_w-18);
      m_tab4_calc_ref_base_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_calc_ref_base_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(tab4_ref_items);i++) m_tab4_calc_ref_base_combo.SetValue(i,tab4_ref_items[i]);
      m_tab4_calc_ref_base_combo.GetListViewPointer().YSize(120);
      m_tab4_calc_ref_base_combo.GetListViewPointer().LightsHover(true);
      m_tab4_calc_ref_base_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_calc_ref_base_combo.CreateComboBox("",tab4_fpad,tab4_ry))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_ref_base_combo);
      m_tab4_calc_ref_base_combo.SelectItem(0);
      tab4_ry+=tab4_sub_control_h+tab4_sub_vgap;

      if(!CreateTextLabel(m_tab4_calc_ref_candle_label,"Candle:",m_tab4_calc_ref_card,m_window_index,m_tab4_calc_tabs,0,tab4_fpad,tab4_ry,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_ref_candle_label.FontSize(9);
      m_tab4_calc_ref_candle_label.LabelColor(C'91,78,64');
      tab4_ry+=tab4_sub_label_h+2;

      string tab4_candle_items[];
      ArrayResize(tab4_candle_items,4);
      tab4_candle_items[0]="Atual";
      tab4_candle_items[1]="Ultimo";
      tab4_candle_items[2]="Penultimo";
      tab4_candle_items[3]="Antipenultimo";

      m_tab4_calc_ref_candle_combo.MainPointer(m_tab4_calc_ref_card);
      m_tab4_calc_tabs.AddToElementsArray(0,m_tab4_calc_ref_candle_combo);
      m_tab4_calc_ref_candle_combo.XSize(tab4_f_w);
      m_tab4_calc_ref_candle_combo.YSize(tab4_sub_control_h);
      m_tab4_calc_ref_candle_combo.BackColor(clrWhite);
      m_tab4_calc_ref_candle_combo.BackColorHover(clrWhite);
      m_tab4_calc_ref_candle_combo.BackColorPressed(clrWhite);
      m_tab4_calc_ref_candle_combo.BorderColor(tab4_sub_border);
      m_tab4_calc_ref_candle_combo.BorderColorHover(tab4_sub_border);
      m_tab4_calc_ref_candle_combo.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_ref_candle_combo.FontSize(10);
      m_tab4_calc_ref_candle_combo.ItemsTotal(ArraySize(tab4_candle_items));
      m_tab4_calc_ref_candle_combo.CheckBoxMode(false);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().XSize(tab4_sub_btn_w);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().XGap(tab4_sub_btn_x);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().YSize(tab4_sub_control_h);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().BorderColorPressed(tab4_sub_border);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().IconXGap(tab4_sub_btn_w-18);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_calc_ref_candle_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(tab4_candle_items);i++) m_tab4_calc_ref_candle_combo.SetValue(i,tab4_candle_items[i]);
      m_tab4_calc_ref_candle_combo.GetListViewPointer().YSize(120);
      m_tab4_calc_ref_candle_combo.GetListViewPointer().LightsHover(true);
      m_tab4_calc_ref_candle_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_calc_ref_candle_combo.CreateComboBox("",tab4_fpad,tab4_ry))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_ref_candle_combo);
      m_tab4_calc_ref_candle_combo.SelectItem(0);
      tab4_ry+=tab4_sub_control_h+tab4_sub_vgap;

      if(!CreateTextLabel(m_tab4_calc_ref_distance_label,"Distancia:",m_tab4_calc_ref_card,m_window_index,m_tab4_calc_tabs,0,tab4_fpad,tab4_ry,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_ref_distance_label.FontSize(9);
      m_tab4_calc_ref_distance_label.LabelColor(C'91,78,64');
      tab4_ry+=tab4_sub_label_h+2;

      m_tab4_calc_ref_distance_spin.MainPointer(m_tab4_calc_ref_card);
      m_tab4_calc_tabs.AddToElementsArray(0,m_tab4_calc_ref_distance_spin);
      m_tab4_calc_ref_distance_spin.XSize(tab4_f_w);
      m_tab4_calc_ref_distance_spin.MaxValue(100000.0);
      m_tab4_calc_ref_distance_spin.MinValue(0.0);
      m_tab4_calc_ref_distance_spin.StepValue(1.0);
      m_tab4_calc_ref_distance_spin.SetDigits(1);
      m_tab4_calc_ref_distance_spin.SpinEditMode(true);
      m_tab4_calc_ref_distance_spin.CheckBoxMode(false);
      m_tab4_calc_ref_distance_spin.SetValue("0.0");
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().XSize(tab4_f_w-34);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab4_calc_ref_distance_spin.CreateTextEdit("",tab4_fpad,tab4_ry))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_ref_distance_spin);
      m_tab4_calc_ref_distance_spin.BackColor(tab4_sub_back);
      m_tab4_calc_ref_distance_spin.BackColorHover(tab4_sub_back);
      m_tab4_calc_ref_distance_spin.BackColorPressed(tab4_sub_back);
      m_tab4_calc_ref_distance_spin.BorderColor(tab4_sub_border);
      m_tab4_calc_ref_distance_spin.BorderColorHover(tab4_sub_border);
      m_tab4_calc_ref_distance_spin.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_ref_distance_spin.GetTextBoxPointer().BorderColorPressed(tab4_sub_border);
      tab4_ry+=tab4_sub_control_h+tab4_sub_vgap;

      if(!CreateTextLabel(m_tab4_calc_ref_expire_label,"Expirar:",m_tab4_calc_ref_card,m_window_index,m_tab4_calc_tabs,0,tab4_fpad,tab4_ry,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_ref_expire_label.FontSize(9);
      m_tab4_calc_ref_expire_label.LabelColor(C'91,78,64');
      tab4_ry+=tab4_sub_label_h+2;

      string tab4_ref_expire_items[];
      ArrayResize(tab4_ref_expire_items,5);
      tab4_ref_expire_items[0]="Nao expirar";
      tab4_ref_expire_items[1]="1 candle";
      tab4_ref_expire_items[2]="2 candles";
      tab4_ref_expire_items[3]="3 candles";
      tab4_ref_expire_items[4]="4 candles";

      m_tab4_calc_ref_expire_combo.MainPointer(m_tab4_calc_ref_card);
      m_tab4_calc_tabs.AddToElementsArray(0,m_tab4_calc_ref_expire_combo);
      m_tab4_calc_ref_expire_combo.XSize(tab4_f_w);
      m_tab4_calc_ref_expire_combo.YSize(tab4_sub_control_h);
      m_tab4_calc_ref_expire_combo.BackColor(clrWhite);
      m_tab4_calc_ref_expire_combo.BackColorHover(clrWhite);
      m_tab4_calc_ref_expire_combo.BackColorPressed(clrWhite);
      m_tab4_calc_ref_expire_combo.BorderColor(tab4_sub_border);
      m_tab4_calc_ref_expire_combo.BorderColorHover(tab4_sub_border);
      m_tab4_calc_ref_expire_combo.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_ref_expire_combo.FontSize(10);
      m_tab4_calc_ref_expire_combo.ItemsTotal(ArraySize(tab4_ref_expire_items));
      m_tab4_calc_ref_expire_combo.CheckBoxMode(false);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().XSize(tab4_sub_btn_w);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().XGap(tab4_sub_btn_x);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().YSize(tab4_sub_control_h);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().BorderColorPressed(tab4_sub_border);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().IconXGap(tab4_sub_btn_w-18);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_calc_ref_expire_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(tab4_ref_expire_items);i++) m_tab4_calc_ref_expire_combo.SetValue(i,tab4_ref_expire_items[i]);
      m_tab4_calc_ref_expire_combo.GetListViewPointer().YSize(120);
      m_tab4_calc_ref_expire_combo.GetListViewPointer().LightsHover(true);
      m_tab4_calc_ref_expire_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_calc_ref_expire_combo.CreateComboBox("",tab4_fpad,tab4_ry))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_ref_expire_combo);
      m_tab4_calc_ref_expire_combo.SelectItem(0);

      // Media tab controls - Tab 4
      int tab4_my=10;
      if(!CreateTextLabel(m_tab4_calc_media_candles_label,"Qtd. candles:",m_tab4_calc_media_card,m_window_index,m_tab4_calc_tabs,1,tab4_fpad,tab4_my,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_media_candles_label.FontSize(9);
      m_tab4_calc_media_candles_label.LabelColor(C'91,78,64');
      tab4_my+=tab4_sub_label_h+2;

      m_tab4_calc_media_candles_spin.MainPointer(m_tab4_calc_media_card);
      m_tab4_calc_tabs.AddToElementsArray(1,m_tab4_calc_media_candles_spin);
      m_tab4_calc_media_candles_spin.XSize(tab4_f_w);
      m_tab4_calc_media_candles_spin.MaxValue(9999.0);
      m_tab4_calc_media_candles_spin.MinValue(1.0);
      m_tab4_calc_media_candles_spin.StepValue(1.0);
      m_tab4_calc_media_candles_spin.SetDigits(0);
      m_tab4_calc_media_candles_spin.SpinEditMode(true);
      m_tab4_calc_media_candles_spin.CheckBoxMode(false);
      m_tab4_calc_media_candles_spin.SetValue("10");
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().XSize(tab4_f_w-34);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab4_calc_media_candles_spin.CreateTextEdit("",tab4_fpad,tab4_my))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_media_candles_spin);
      m_tab4_calc_media_candles_spin.BackColor(tab4_sub_back);
      m_tab4_calc_media_candles_spin.BackColorHover(tab4_sub_back);
      m_tab4_calc_media_candles_spin.BackColorPressed(tab4_sub_back);
      m_tab4_calc_media_candles_spin.BorderColor(tab4_sub_border);
      m_tab4_calc_media_candles_spin.BorderColorHover(tab4_sub_border);
      m_tab4_calc_media_candles_spin.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_media_candles_spin.GetTextBoxPointer().BorderColorPressed(tab4_sub_border);
      tab4_my+=tab4_sub_control_h+tab4_sub_vgap;

      if(!CreateTextLabel(m_tab4_calc_media_base_label,"Base:",m_tab4_calc_media_card,m_window_index,m_tab4_calc_tabs,1,tab4_fpad,tab4_my,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_media_base_label.FontSize(9);
      m_tab4_calc_media_base_label.LabelColor(C'91,78,64');
      tab4_my+=tab4_sub_label_h+2;

      string tab4_media_base_items[];
      ArrayResize(tab4_media_base_items,4);
      tab4_media_base_items[0]="Maxima";
      tab4_media_base_items[1]="Minima";
      tab4_media_base_items[2]="Abertura";
      tab4_media_base_items[3]="Fechamento";

      m_tab4_calc_media_base_combo.MainPointer(m_tab4_calc_media_card);
      m_tab4_calc_tabs.AddToElementsArray(1,m_tab4_calc_media_base_combo);
      m_tab4_calc_media_base_combo.XSize(tab4_f_w);
      m_tab4_calc_media_base_combo.YSize(tab4_sub_control_h);
      m_tab4_calc_media_base_combo.BackColor(clrWhite);
      m_tab4_calc_media_base_combo.BackColorHover(clrWhite);
      m_tab4_calc_media_base_combo.BackColorPressed(clrWhite);
      m_tab4_calc_media_base_combo.BorderColor(tab4_sub_border);
      m_tab4_calc_media_base_combo.BorderColorHover(tab4_sub_border);
      m_tab4_calc_media_base_combo.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_media_base_combo.FontSize(10);
      m_tab4_calc_media_base_combo.ItemsTotal(ArraySize(tab4_media_base_items));
      m_tab4_calc_media_base_combo.CheckBoxMode(false);
      m_tab4_calc_media_base_combo.GetButtonPointer().XSize(tab4_sub_btn_w);
      m_tab4_calc_media_base_combo.GetButtonPointer().XGap(tab4_sub_btn_x);
      m_tab4_calc_media_base_combo.GetButtonPointer().YSize(tab4_sub_control_h);
      m_tab4_calc_media_base_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_calc_media_base_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_calc_media_base_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_calc_media_base_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_calc_media_base_combo.GetButtonPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_media_base_combo.GetButtonPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_media_base_combo.GetButtonPointer().BorderColorPressed(tab4_sub_border);
      m_tab4_calc_media_base_combo.GetButtonPointer().IconXGap(tab4_sub_btn_w-18);
      m_tab4_calc_media_base_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_calc_media_base_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(tab4_media_base_items);i++) m_tab4_calc_media_base_combo.SetValue(i,tab4_media_base_items[i]);
      m_tab4_calc_media_base_combo.GetListViewPointer().YSize(120);
      m_tab4_calc_media_base_combo.GetListViewPointer().LightsHover(true);
      m_tab4_calc_media_base_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_calc_media_base_combo.CreateComboBox("",tab4_fpad,tab4_my))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_media_base_combo);
      m_tab4_calc_media_base_combo.SelectItem(0);
      tab4_my+=tab4_sub_control_h+tab4_sub_vgap;

      if(!CreateTextLabel(m_tab4_calc_media_distance_label,"Distancia:",m_tab4_calc_media_card,m_window_index,m_tab4_calc_tabs,1,tab4_fpad,tab4_my,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_media_distance_label.FontSize(9);
      m_tab4_calc_media_distance_label.LabelColor(C'91,78,64');
      tab4_my+=tab4_sub_label_h+2;

      m_tab4_calc_media_distance_spin.MainPointer(m_tab4_calc_media_card);
      m_tab4_calc_tabs.AddToElementsArray(1,m_tab4_calc_media_distance_spin);
      m_tab4_calc_media_distance_spin.XSize(tab4_f_w);
      m_tab4_calc_media_distance_spin.MaxValue(100000.0);
      m_tab4_calc_media_distance_spin.MinValue(0.0);
      m_tab4_calc_media_distance_spin.StepValue(1.0);
      m_tab4_calc_media_distance_spin.SetDigits(1);
      m_tab4_calc_media_distance_spin.SpinEditMode(true);
      m_tab4_calc_media_distance_spin.CheckBoxMode(false);
      m_tab4_calc_media_distance_spin.SetValue("0.0");
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().XSize(tab4_f_w-34);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab4_calc_media_distance_spin.CreateTextEdit("",tab4_fpad,tab4_my))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_media_distance_spin);
      m_tab4_calc_media_distance_spin.BackColor(tab4_sub_back);
      m_tab4_calc_media_distance_spin.BackColorHover(tab4_sub_back);
      m_tab4_calc_media_distance_spin.BackColorPressed(tab4_sub_back);
      m_tab4_calc_media_distance_spin.BorderColor(tab4_sub_border);
      m_tab4_calc_media_distance_spin.BorderColorHover(tab4_sub_border);
      m_tab4_calc_media_distance_spin.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_media_distance_spin.GetTextBoxPointer().BorderColorPressed(tab4_sub_border);
      tab4_my+=tab4_sub_control_h+tab4_sub_vgap;

      if(!CreateTextLabel(m_tab4_calc_media_expire_label,"Expirar:",m_tab4_calc_media_card,m_window_index,m_tab4_calc_tabs,1,tab4_fpad,tab4_my,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_media_expire_label.FontSize(9);
      m_tab4_calc_media_expire_label.LabelColor(C'91,78,64');
      tab4_my+=tab4_sub_label_h+2;

      string tab4_media_expire_items[];
      ArrayResize(tab4_media_expire_items,5);
      tab4_media_expire_items[0]="Nao expirar";
      tab4_media_expire_items[1]="1 candle";
      tab4_media_expire_items[2]="2 candles";
      tab4_media_expire_items[3]="3 candles";
      tab4_media_expire_items[4]="4 candles";

      m_tab4_calc_media_expire_combo.MainPointer(m_tab4_calc_media_card);
      m_tab4_calc_tabs.AddToElementsArray(1,m_tab4_calc_media_expire_combo);
      m_tab4_calc_media_expire_combo.XSize(tab4_f_w);
      m_tab4_calc_media_expire_combo.YSize(tab4_sub_control_h);
      m_tab4_calc_media_expire_combo.BackColor(clrWhite);
      m_tab4_calc_media_expire_combo.BackColorHover(clrWhite);
      m_tab4_calc_media_expire_combo.BackColorPressed(clrWhite);
      m_tab4_calc_media_expire_combo.BorderColor(tab4_sub_border);
      m_tab4_calc_media_expire_combo.BorderColorHover(tab4_sub_border);
      m_tab4_calc_media_expire_combo.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_media_expire_combo.FontSize(10);
      m_tab4_calc_media_expire_combo.ItemsTotal(ArraySize(tab4_media_expire_items));
      m_tab4_calc_media_expire_combo.CheckBoxMode(false);
      m_tab4_calc_media_expire_combo.GetButtonPointer().XSize(tab4_sub_btn_w);
      m_tab4_calc_media_expire_combo.GetButtonPointer().XGap(tab4_sub_btn_x);
      m_tab4_calc_media_expire_combo.GetButtonPointer().YSize(tab4_sub_control_h);
      m_tab4_calc_media_expire_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_calc_media_expire_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_calc_media_expire_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_calc_media_expire_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_calc_media_expire_combo.GetButtonPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_media_expire_combo.GetButtonPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_media_expire_combo.GetButtonPointer().BorderColorPressed(tab4_sub_border);
      m_tab4_calc_media_expire_combo.GetButtonPointer().IconXGap(tab4_sub_btn_w-18);
      m_tab4_calc_media_expire_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_calc_media_expire_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(tab4_media_expire_items);i++) m_tab4_calc_media_expire_combo.SetValue(i,tab4_media_expire_items[i]);
      m_tab4_calc_media_expire_combo.GetListViewPointer().YSize(120);
      m_tab4_calc_media_expire_combo.GetListViewPointer().LightsHover(true);
      m_tab4_calc_media_expire_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_calc_media_expire_combo.CreateComboBox("",tab4_fpad,tab4_my))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_media_expire_combo);
      m_tab4_calc_media_expire_combo.SelectItem(0);

      // Max/Min tab controls - Tab 4
      int tab4_maxmin_y=10;
      if(!CreateTextLabel(m_tab4_calc_maxmin_base_label,"Maior:",m_tab4_calc_maxmin_card,m_window_index,m_tab4_calc_tabs,2,tab4_fpad,tab4_maxmin_y,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_maxmin_base_label.FontSize(9);
      m_tab4_calc_maxmin_base_label.LabelColor(C'91,78,64');
      tab4_maxmin_y+=tab4_sub_label_h+2;

      string tab4_maxmin_items[];
      ArrayResize(tab4_maxmin_items,4);
      tab4_maxmin_items[0]="Maxima";
      tab4_maxmin_items[1]="Minima";
      tab4_maxmin_items[2]="Abertura";
      tab4_maxmin_items[3]="Fechamento";

      m_tab4_calc_maxmin_base_combo.MainPointer(m_tab4_calc_maxmin_card);
      m_tab4_calc_tabs.AddToElementsArray(2,m_tab4_calc_maxmin_base_combo);
      m_tab4_calc_maxmin_base_combo.XSize(tab4_f_w);
      m_tab4_calc_maxmin_base_combo.YSize(tab4_sub_control_h);
      m_tab4_calc_maxmin_base_combo.BackColor(clrWhite);
      m_tab4_calc_maxmin_base_combo.BackColorHover(clrWhite);
      m_tab4_calc_maxmin_base_combo.BackColorPressed(clrWhite);
      m_tab4_calc_maxmin_base_combo.BorderColor(tab4_sub_border);
      m_tab4_calc_maxmin_base_combo.BorderColorHover(tab4_sub_border);
      m_tab4_calc_maxmin_base_combo.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_maxmin_base_combo.FontSize(10);
      m_tab4_calc_maxmin_base_combo.ItemsTotal(ArraySize(tab4_maxmin_items));
      m_tab4_calc_maxmin_base_combo.CheckBoxMode(false);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().XSize(tab4_sub_btn_w);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().XGap(tab4_sub_btn_x);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().YSize(tab4_sub_control_h);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().BorderColorPressed(tab4_sub_border);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().IconXGap(tab4_sub_btn_w-18);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().LabelXGap(10);
      m_tab4_calc_maxmin_base_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(tab4_maxmin_items);i++) m_tab4_calc_maxmin_base_combo.SetValue(i,tab4_maxmin_items[i]);
      m_tab4_calc_maxmin_base_combo.GetListViewPointer().YSize(80);
      m_tab4_calc_maxmin_base_combo.GetListViewPointer().LightsHover(true);
      m_tab4_calc_maxmin_base_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab4_calc_maxmin_base_combo.CreateComboBox("",tab4_fpad,tab4_maxmin_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_maxmin_base_combo);
      m_tab4_calc_maxmin_base_combo.SelectItem(0);
      tab4_maxmin_y+=tab4_sub_control_h+tab4_sub_vgap;

      if(!CreateTextLabel(m_tab4_calc_maxmin_count_label,"Dos ultimos:",m_tab4_calc_maxmin_card,m_window_index,m_tab4_calc_tabs,2,tab4_fpad,tab4_maxmin_y,tab4_f_w,tab4_sub_label_h))
         return(false);
      m_tab4_calc_maxmin_count_label.FontSize(9);
      m_tab4_calc_maxmin_count_label.LabelColor(C'91,78,64');
      tab4_maxmin_y+=tab4_sub_label_h+2;

      m_tab4_calc_maxmin_count_spin.MainPointer(m_tab4_calc_maxmin_card);
      m_tab4_calc_tabs.AddToElementsArray(2,m_tab4_calc_maxmin_count_spin);
      m_tab4_calc_maxmin_count_spin.XSize(tab4_f_w);
      m_tab4_calc_maxmin_count_spin.MaxValue(9999.0);
      m_tab4_calc_maxmin_count_spin.MinValue(1.0);
      m_tab4_calc_maxmin_count_spin.StepValue(1.0);
      m_tab4_calc_maxmin_count_spin.SetDigits(0);
      m_tab4_calc_maxmin_count_spin.SpinEditMode(true);
      m_tab4_calc_maxmin_count_spin.CheckBoxMode(false);
      m_tab4_calc_maxmin_count_spin.SetValue("3");
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().XSize(tab4_f_w-34);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab4_calc_maxmin_count_spin.CreateTextEdit("",tab4_fpad,tab4_maxmin_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab4_calc_maxmin_count_spin);
      m_tab4_calc_maxmin_count_spin.BackColor(tab4_sub_back);
      m_tab4_calc_maxmin_count_spin.BackColorHover(tab4_sub_back);
      m_tab4_calc_maxmin_count_spin.BackColorPressed(tab4_sub_back);
      m_tab4_calc_maxmin_count_spin.BorderColor(tab4_sub_border);
      m_tab4_calc_maxmin_count_spin.BorderColorHover(tab4_sub_border);
      m_tab4_calc_maxmin_count_spin.BorderColorPressed(tab4_sub_border);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().BorderColor(tab4_sub_border);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().BorderColorHover(tab4_sub_border);
      m_tab4_calc_maxmin_count_spin.GetTextBoxPointer().BorderColorPressed(tab4_sub_border);

      // Tab 5 (Break even): combobox padrao + card
      if(!CreateTextLabel(m_tab5_padrao_label,"Padrao",m_tabs,m_window_index,m_tabs,4,content_pad,content_y+66,card_w,18))
         return(false);
      m_tab5_padrao_label.FontSize(10);
      m_tab5_padrao_label.LabelColor(C'91,78,64');

      string items_tab5_padrao[];
      ArrayResize(items_tab5_padrao,2);
      items_tab5_padrao[0]="Pontos";
      items_tab5_padrao[1]="Percentual";

      m_tab5_padrao_combo.MainPointer(m_tabs);
      m_tabs.AddToElementsArray(4,m_tab5_padrao_combo);
      m_tab5_padrao_combo.XSize(260);
      m_tab5_padrao_combo.YSize(20);
      m_tab5_padrao_combo.BackColor(clrWhite);
      m_tab5_padrao_combo.BackColorHover(clrWhite);
      m_tab5_padrao_combo.BackColorPressed(clrWhite);
      m_tab5_padrao_combo.BorderColor(tab2_border);
      m_tab5_padrao_combo.BorderColorHover(tab2_border);
      m_tab5_padrao_combo.BorderColorPressed(tab2_border);
      m_tab5_padrao_combo.FontSize(10);
      m_tab5_padrao_combo.ItemsTotal(ArraySize(items_tab5_padrao));
      m_tab5_padrao_combo.CheckBoxMode(false);
      m_tab5_padrao_combo.GetButtonPointer().XGap(1);
      m_tab5_padrao_combo.GetButtonPointer().XSize(258);
      m_tab5_padrao_combo.GetButtonPointer().YSize(20);
      m_tab5_padrao_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab5_padrao_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab5_padrao_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab5_padrao_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab5_padrao_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab5_padrao_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab5_padrao_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab5_padrao_combo.GetButtonPointer().IconXGap(258-18);
      m_tab5_padrao_combo.GetButtonPointer().LabelXGap(10);
      m_tab5_padrao_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_tab5_padrao);i++) m_tab5_padrao_combo.SetValue(i,items_tab5_padrao[i]);
      m_tab5_padrao_combo.GetListViewPointer().YSize(80);
      m_tab5_padrao_combo.GetListViewPointer().LightsHover(true);
      m_tab5_padrao_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab5_padrao_combo.CreateComboBox("",content_pad,content_y+88))
         return(false);
      AddToElementsArray(m_window_index,m_tab5_padrao_combo);
      m_tab5_padrao_combo.SelectItem(0);

      const int tab5_x=content_pad;
      const int tab5_y=content_y+120;
      const int tab5_w=card_w;
      const int tab5_h=340;
      if(!CreateFrame(m_tab5_card_breakeven,"",m_tabs,m_window_index,m_tabs,4,tab5_x,tab5_y,tab5_w,tab5_h,1))
         return(false);
      m_tab5_card_breakeven.BackColor(C'233,220,203');
      m_tab5_card_breakeven.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab5_card_breakeven_title,"Break even",m_tab5_card_breakeven,m_window_index,m_tabs,4,16,12,tab5_w-32,22))
         return(false);
      m_tab5_card_breakeven_title.FontSize(12);
      m_tab5_card_breakeven_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab5_use_breakeven,"Ativar break even",m_tab5_card_breakeven,m_window_index,m_tabs,4,16,44,tab5_w-32,false,false,false))
         return(false);
      m_tab5_use_breakeven.FontSize(10);
      m_tab5_use_breakeven.LabelColor(C'43,43,43');

      if(!CreateTextLabel(m_tab5_inicio_label,"Inicio",m_tab5_card_breakeven,m_window_index,m_tabs,4,16,76,tab5_w-32,18))
         return(false);
      m_tab5_inicio_label.FontSize(10);
      m_tab5_inicio_label.LabelColor(C'91,78,64');

      const int tab5_edit_w=tab5_w-32;
      const int tab5_edit_text_w=tab5_edit_w-34;
      m_tab5_inicio_spin.MainPointer(m_tab5_card_breakeven);
      m_tabs.AddToElementsArray(4,m_tab5_inicio_spin);
      m_tab5_inicio_spin.XSize(tab5_edit_w);
      m_tab5_inicio_spin.MaxValue(100000.0);
      m_tab5_inicio_spin.MinValue(0.0);
      m_tab5_inicio_spin.StepValue(1.0);
      m_tab5_inicio_spin.SetDigits(1);
      m_tab5_inicio_spin.SpinEditMode(true);
      m_tab5_inicio_spin.CheckBoxMode(false);
      m_tab5_inicio_spin.SetValue("0.0");
      m_tab5_inicio_spin.AnchorBottomWindowSide(false);
      m_tab5_inicio_spin.GetTextBoxPointer().XSize(tab5_edit_text_w);
      m_tab5_inicio_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab5_inicio_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab5_inicio_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab5_inicio_spin.CreateTextEdit("",16,98))
         return(false);
      AddToElementsArray(m_window_index,m_tab5_inicio_spin);
      m_tab5_inicio_spin.BackColor(C'233,220,203');
      m_tab5_inicio_spin.BackColorHover(C'233,220,203');
      m_tab5_inicio_spin.BackColorPressed(C'233,220,203');
      m_tab5_inicio_spin.BorderColor(tab2_border);
      m_tab5_inicio_spin.BorderColorHover(tab2_border);
      m_tab5_inicio_spin.BorderColorPressed(tab2_border);
      m_tab5_inicio_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab5_inicio_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab5_inicio_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab5_inicio_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab5_inicio_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab5_inicio_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab5_inicio_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab5_inicio_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab5_inicio_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab5_inicio_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab5_inicio_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab5_inicio_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab5_inicio_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab5_inicio_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab5_inicio_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab5_inicio_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab5_inicio_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab5_inicio_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

      if(!CreateTextLabel(m_tab5_dist_label,"Distancia",m_tab5_card_breakeven,m_window_index,m_tabs,4,16,132,tab5_w-32,18))
         return(false);
      m_tab5_dist_label.FontSize(10);
      m_tab5_dist_label.LabelColor(C'91,78,64');

      m_tab5_dist_spin.MainPointer(m_tab5_card_breakeven);
      m_tabs.AddToElementsArray(4,m_tab5_dist_spin);
      m_tab5_dist_spin.XSize(tab5_edit_w);
      m_tab5_dist_spin.MaxValue(100000.0);
      m_tab5_dist_spin.MinValue(0.0);
      m_tab5_dist_spin.StepValue(1.0);
      m_tab5_dist_spin.SetDigits(1);
      m_tab5_dist_spin.SpinEditMode(true);
      m_tab5_dist_spin.CheckBoxMode(false);
      m_tab5_dist_spin.SetValue("100.0");
      m_tab5_dist_spin.AnchorBottomWindowSide(false);
      m_tab5_dist_spin.GetTextBoxPointer().XSize(tab5_edit_text_w);
      m_tab5_dist_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab5_dist_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab5_dist_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab5_dist_spin.CreateTextEdit("",16,154))
         return(false);
      AddToElementsArray(m_window_index,m_tab5_dist_spin);
      m_tab5_dist_spin.BackColor(C'233,220,203');
      m_tab5_dist_spin.BackColorHover(C'233,220,203');
      m_tab5_dist_spin.BackColorPressed(C'233,220,203');
      m_tab5_dist_spin.BorderColor(tab2_border);
      m_tab5_dist_spin.BorderColorHover(tab2_border);
      m_tab5_dist_spin.BorderColorPressed(tab2_border);
      m_tab5_dist_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab5_dist_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab5_dist_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab5_dist_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab5_dist_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab5_dist_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab5_dist_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab5_dist_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab5_dist_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab5_dist_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab5_dist_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab5_dist_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab5_dist_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab5_dist_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab5_dist_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab5_dist_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab5_dist_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab5_dist_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

      // Tab 6 (Trailing stop): combobox pontos/% + card padrao
      if(!CreateTextLabel(m_tab6_calc_type_label,"Tipo de calculo",m_tabs,m_window_index,m_tabs,5,content_pad,content_y+66,card_w,18))
         return(false);
      m_tab6_calc_type_label.FontSize(10);
      m_tab6_calc_type_label.LabelColor(C'91,78,64');

      string items_tab6_calc[];
      ArrayResize(items_tab6_calc,2);
      items_tab6_calc[0]="Pontos";
      items_tab6_calc[1]="Percentual";

      m_tab6_calc_type.MainPointer(m_tabs);
      m_tabs.AddToElementsArray(5,m_tab6_calc_type);
      m_tab6_calc_type.XSize(260);
      m_tab6_calc_type.YSize(20);
      m_tab6_calc_type.BackColor(clrWhite);
      m_tab6_calc_type.BackColorHover(clrWhite);
      m_tab6_calc_type.BackColorPressed(clrWhite);
      m_tab6_calc_type.BorderColor(tab2_border);
      m_tab6_calc_type.BorderColorHover(tab2_border);
      m_tab6_calc_type.BorderColorPressed(tab2_border);
      m_tab6_calc_type.FontSize(10);
      m_tab6_calc_type.ItemsTotal(ArraySize(items_tab6_calc));
      m_tab6_calc_type.CheckBoxMode(false);
      m_tab6_calc_type.GetButtonPointer().XGap(1);
      m_tab6_calc_type.GetButtonPointer().XSize(258);
      m_tab6_calc_type.GetButtonPointer().YSize(20);
      m_tab6_calc_type.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab6_calc_type.GetButtonPointer().BackColor(clrWhite);
      m_tab6_calc_type.GetButtonPointer().BackColorHover(clrWhite);
      m_tab6_calc_type.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab6_calc_type.GetButtonPointer().BorderColor(tab2_border);
      m_tab6_calc_type.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab6_calc_type.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_calc_type.GetButtonPointer().IconXGap(258-18);
      m_tab6_calc_type.GetButtonPointer().LabelXGap(10);
      m_tab6_calc_type.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_tab6_calc);i++) m_tab6_calc_type.SetValue(i,items_tab6_calc[i]);
      m_tab6_calc_type.GetListViewPointer().YSize(80);
      m_tab6_calc_type.GetListViewPointer().LightsHover(true);
      m_tab6_calc_type.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab6_calc_type.CreateComboBox("",content_pad,content_y+88))
         return(false);
      AddToElementsArray(m_window_index,m_tab6_calc_type);
      m_tab6_calc_type.SelectItem(0);

      const int tab6_x=content_pad;
      const int tab6_y=content_y+120;
      const int tab6_w=card_w;
      const int tab6_h=340;
      if(!CreateFrame(m_tab6_card_padrao,"",m_tabs,m_window_index,m_tabs,5,tab6_x,tab6_y,tab6_w,tab6_h,1))
         return(false);
      m_tab6_card_padrao.BackColor(C'233,220,203');
      m_tab6_card_padrao.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab6_card_padrao_title,"Trailing stop (padrao)",m_tab6_card_padrao,m_window_index,m_tabs,5,16,12,tab6_w-32,22))
         return(false);
      m_tab6_card_padrao_title.FontSize(12);
      m_tab6_card_padrao_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab6_use_padrao,"Usar trailing stop padrao",m_tab6_card_padrao,m_window_index,m_tabs,5,16,44,tab6_w-32,false,false,false))
         return(false);
      m_tab6_use_padrao.FontSize(10);
      m_tab6_use_padrao.LabelColor(C'43,43,43');

      if(!CreateTextLabel(m_tab6_dist_label,"Adicionar a favor",m_tab6_card_padrao,m_window_index,m_tabs,5,16,76,tab6_w-32,18))
         return(false);
      m_tab6_dist_label.FontSize(10);
      m_tab6_dist_label.LabelColor(C'91,78,64');

      const int tab6_dist_w=tab6_w-32;
      const int tab6_dist_edit_w=tab6_dist_w-34;
      m_tab6_dist_spin.MainPointer(m_tab6_card_padrao);
      m_tabs.AddToElementsArray(5,m_tab6_dist_spin);
      m_tab6_dist_spin.XSize(tab6_dist_w);
      m_tab6_dist_spin.MaxValue(100000.0);
      m_tab6_dist_spin.MinValue(0.0);
      m_tab6_dist_spin.StepValue(1.0);
      m_tab6_dist_spin.SetDigits(1);
      m_tab6_dist_spin.SpinEditMode(true);
      m_tab6_dist_spin.CheckBoxMode(false);
      m_tab6_dist_spin.SetValue("0.0");
      m_tab6_dist_spin.AnchorBottomWindowSide(false);
      m_tab6_dist_spin.GetTextBoxPointer().XSize(tab6_dist_edit_w);
      m_tab6_dist_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab6_dist_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab6_dist_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab6_dist_spin.CreateTextEdit("",16,98))
         return(false);
      AddToElementsArray(m_window_index,m_tab6_dist_spin);
      m_tab6_dist_spin.BackColor(C'233,220,203');
      m_tab6_dist_spin.BackColorHover(C'233,220,203');
      m_tab6_dist_spin.BackColorPressed(C'233,220,203');
      m_tab6_dist_spin.BorderColor(tab2_border);
      m_tab6_dist_spin.BorderColorHover(tab2_border);
      m_tab6_dist_spin.BorderColorPressed(tab2_border);
      m_tab6_dist_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab6_dist_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab6_dist_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab6_dist_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab6_dist_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab6_dist_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab6_dist_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab6_dist_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab6_dist_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab6_dist_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab6_dist_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab6_dist_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_dist_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab6_dist_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab6_dist_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab6_dist_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab6_dist_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab6_dist_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

      if(!CreateTextLabel(m_tab6_passo_label,"Passo",m_tab6_card_padrao,m_window_index,m_tabs,5,16,132,tab6_w-32,18))
         return(false);
      m_tab6_passo_label.FontSize(10);
      m_tab6_passo_label.LabelColor(C'91,78,64');

      m_tab6_passo_spin.MainPointer(m_tab6_card_padrao);
      m_tabs.AddToElementsArray(5,m_tab6_passo_spin);
      m_tab6_passo_spin.XSize(tab6_dist_w);
      m_tab6_passo_spin.MaxValue(100000.0);
      m_tab6_passo_spin.MinValue(0.0);
      m_tab6_passo_spin.StepValue(1.0);
      m_tab6_passo_spin.SetDigits(0);
      m_tab6_passo_spin.SpinEditMode(true);
      m_tab6_passo_spin.CheckBoxMode(false);
      m_tab6_passo_spin.SetValue("0");
      m_tab6_passo_spin.AnchorBottomWindowSide(false);
      m_tab6_passo_spin.GetTextBoxPointer().XSize(tab6_dist_edit_w);
      m_tab6_passo_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab6_passo_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab6_passo_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab6_passo_spin.CreateTextEdit("",16,154))
         return(false);
      AddToElementsArray(m_window_index,m_tab6_passo_spin);
      m_tab6_passo_spin.BackColor(C'233,220,203');
      m_tab6_passo_spin.BackColorHover(C'233,220,203');
      m_tab6_passo_spin.BackColorPressed(C'233,220,203');
      m_tab6_passo_spin.BorderColor(tab2_border);
      m_tab6_passo_spin.BorderColorHover(tab2_border);
      m_tab6_passo_spin.BorderColorPressed(tab2_border);
      m_tab6_passo_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab6_passo_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab6_passo_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab6_passo_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab6_passo_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab6_passo_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab6_passo_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab6_passo_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab6_passo_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab6_passo_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab6_passo_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab6_passo_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_passo_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab6_passo_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab6_passo_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab6_passo_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab6_passo_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab6_passo_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

      // Tab 6: Trailing stop (candle a candle) card
      const int tab6_candles_card_x=content_pad + card_w + card_gap;
      if(!CreateFrame(m_tab6_card_candles,"",m_tabs,m_window_index,m_tabs,5,tab6_candles_card_x,tab6_y,tab6_w,tab6_h,1))
         return(false);
      m_tab6_card_candles.BackColor(C'233,220,203');
      m_tab6_card_candles.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab6_card_candles_title,"Trailing stop (candle a candle)",m_tab6_card_candles,m_window_index,m_tabs,5,16,12,tab6_w-32,22))
         return(false);
      m_tab6_card_candles_title.FontSize(12);
      m_tab6_card_candles_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab6_use_candles,"Candle a Candle",m_tab6_card_candles,m_window_index,m_tabs,5,16,44,tab6_w-32,false,false,false))
         return(false);
      m_tab6_use_candles.FontSize(10);
      m_tab6_use_candles.LabelColor(C'43,43,43');

      const int tab6_cw=tab6_w-32;
      const int tab6_edit_w=tab6_cw-34;
      int tab6_cy=76;

      if(!CreateTextLabel(m_tab6_candles_trigger_label,"Disparo (pontos)",m_tab6_card_candles,m_window_index,m_tabs,5,16,tab6_cy,tab6_w-32,18))
         return(false);
      m_tab6_candles_trigger_label.FontSize(10);
      m_tab6_candles_trigger_label.LabelColor(C'91,78,64');
      tab6_cy+=18+2;

      m_tab6_candles_trigger_spin.MainPointer(m_tab6_card_candles);
      m_tabs.AddToElementsArray(5,m_tab6_candles_trigger_spin);
      m_tab6_candles_trigger_spin.XSize(tab6_cw);
      m_tab6_candles_trigger_spin.MaxValue(100000.0);
      m_tab6_candles_trigger_spin.MinValue(0.0);
      m_tab6_candles_trigger_spin.StepValue(1.0);
      m_tab6_candles_trigger_spin.SetDigits(1);
      m_tab6_candles_trigger_spin.SpinEditMode(true);
      m_tab6_candles_trigger_spin.CheckBoxMode(false);
      m_tab6_candles_trigger_spin.SetValue("0.0");
      m_tab6_candles_trigger_spin.AnchorBottomWindowSide(false);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().XSize(tab6_edit_w);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab6_candles_trigger_spin.CreateTextEdit("",16,tab6_cy))
         return(false);
      AddToElementsArray(m_window_index,m_tab6_candles_trigger_spin);
      m_tab6_candles_trigger_spin.BackColor(C'233,220,203');
      m_tab6_candles_trigger_spin.BackColorHover(C'233,220,203');
      m_tab6_candles_trigger_spin.BackColorPressed(C'233,220,203');
      m_tab6_candles_trigger_spin.BorderColor(tab2_border);
      m_tab6_candles_trigger_spin.BorderColorHover(tab2_border);
      m_tab6_candles_trigger_spin.BorderColorPressed(tab2_border);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab6_candles_trigger_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab6_candles_trigger_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab6_candles_trigger_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab6_candles_trigger_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab6_candles_trigger_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab6_candles_trigger_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab6_candles_trigger_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_candles_trigger_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab6_candles_trigger_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab6_candles_trigger_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab6_candles_trigger_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab6_candles_trigger_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab6_candles_trigger_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);
      tab6_cy+=20+10;

      if(!CreateTextLabel(m_tab6_candles_pos_label,"Posicao",m_tab6_card_candles,m_window_index,m_tabs,5,16,tab6_cy,tab6_w-32,18))
         return(false);
      m_tab6_candles_pos_label.FontSize(10);
      m_tab6_candles_pos_label.LabelColor(C'91,78,64');
      tab6_cy+=18+2;

      string tab6_pos_items[];
      ArrayResize(tab6_pos_items,4);
      tab6_pos_items[0]="Abertura";
      tab6_pos_items[1]="Fechamento";
      tab6_pos_items[2]="Maxima";
      tab6_pos_items[3]="Minima";

      const int tab6_pcw=tab6_cw;
      m_tab6_candles_pos_combo.MainPointer(m_tab6_card_candles);
      m_tabs.AddToElementsArray(5,m_tab6_candles_pos_combo);
      m_tab6_candles_pos_combo.XSize(tab6_pcw);
      m_tab6_candles_pos_combo.YSize(20);
      m_tab6_candles_pos_combo.BackColor(clrWhite);
      m_tab6_candles_pos_combo.BackColorHover(clrWhite);
      m_tab6_candles_pos_combo.BackColorPressed(clrWhite);
      m_tab6_candles_pos_combo.BorderColor(tab2_border);
      m_tab6_candles_pos_combo.BorderColorHover(tab2_border);
      m_tab6_candles_pos_combo.BorderColorPressed(tab2_border);
      m_tab6_candles_pos_combo.FontSize(10);
      m_tab6_candles_pos_combo.ItemsTotal(ArraySize(tab6_pos_items));
      m_tab6_candles_pos_combo.CheckBoxMode(false);
      m_tab6_candles_pos_combo.GetButtonPointer().XGap(1);
      m_tab6_candles_pos_combo.GetButtonPointer().XSize(tab6_pcw-2);
      m_tab6_candles_pos_combo.GetButtonPointer().YSize(20);
      m_tab6_candles_pos_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab6_candles_pos_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab6_candles_pos_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab6_candles_pos_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab6_candles_pos_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab6_candles_pos_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab6_candles_pos_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_candles_pos_combo.GetButtonPointer().IconXGap((tab6_pcw-2)-18);
      m_tab6_candles_pos_combo.GetButtonPointer().LabelXGap(10);
      m_tab6_candles_pos_combo.GetButtonPointer().LabelColor(C'43,43,43');
      m_tab6_candles_pos_combo.GetListViewPointer().YSize(120);
      m_tab6_candles_pos_combo.GetListViewPointer().LightsHover(true);
      m_tab6_candles_pos_combo.GetListViewPointer().BackColor(clrWhite);
      for(int i=0;i<ArraySize(tab6_pos_items);i++) m_tab6_candles_pos_combo.SetValue(i,tab6_pos_items[i]);
      if(!m_tab6_candles_pos_combo.CreateComboBox("",16,tab6_cy))
         return(false);
      AddToElementsArray(m_window_index,m_tab6_candles_pos_combo);
      m_tab6_candles_pos_combo.SelectItem(0);
      tab6_cy+=20+10;

      if(!CreateTextLabel(m_tab6_candles_candle_label,"Candle",m_tab6_card_candles,m_window_index,m_tabs,5,16,tab6_cy,tab6_w-32,18))
         return(false);
      m_tab6_candles_candle_label.FontSize(10);
      m_tab6_candles_candle_label.LabelColor(C'91,78,64');
      tab6_cy+=18+2;

      string tab6_candle_items[];
      ArrayResize(tab6_candle_items,4);
      tab6_candle_items[0]="Atual (0)";
      tab6_candle_items[1]="Anterior (1)";
      tab6_candle_items[2]="2 candles (2)";
      tab6_candle_items[3]="3 candles (3)";

      const int tab6_ccw=tab6_cw;
      m_tab6_candles_candle_combo.MainPointer(m_tab6_card_candles);
      m_tabs.AddToElementsArray(5,m_tab6_candles_candle_combo);
      m_tab6_candles_candle_combo.XSize(tab6_ccw);
      m_tab6_candles_candle_combo.YSize(20);
      m_tab6_candles_candle_combo.BackColor(clrWhite);
      m_tab6_candles_candle_combo.BackColorHover(clrWhite);
      m_tab6_candles_candle_combo.BackColorPressed(clrWhite);
      m_tab6_candles_candle_combo.BorderColor(tab2_border);
      m_tab6_candles_candle_combo.BorderColorHover(tab2_border);
      m_tab6_candles_candle_combo.BorderColorPressed(tab2_border);
      m_tab6_candles_candle_combo.FontSize(10);
      m_tab6_candles_candle_combo.ItemsTotal(ArraySize(tab6_candle_items));
      m_tab6_candles_candle_combo.CheckBoxMode(false);
      m_tab6_candles_candle_combo.GetButtonPointer().XGap(1);
      m_tab6_candles_candle_combo.GetButtonPointer().XSize(tab6_ccw-2);
      m_tab6_candles_candle_combo.GetButtonPointer().YSize(20);
      m_tab6_candles_candle_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab6_candles_candle_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab6_candles_candle_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab6_candles_candle_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab6_candles_candle_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab6_candles_candle_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab6_candles_candle_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_candles_candle_combo.GetButtonPointer().IconXGap((tab6_ccw-2)-18);
      m_tab6_candles_candle_combo.GetButtonPointer().LabelXGap(10);
      m_tab6_candles_candle_combo.GetButtonPointer().LabelColor(C'43,43,43');
      m_tab6_candles_candle_combo.GetListViewPointer().YSize(120);
      m_tab6_candles_candle_combo.GetListViewPointer().LightsHover(true);
      m_tab6_candles_candle_combo.GetListViewPointer().BackColor(clrWhite);
      for(int i=0;i<ArraySize(tab6_candle_items);i++) m_tab6_candles_candle_combo.SetValue(i,tab6_candle_items[i]);
      if(!m_tab6_candles_candle_combo.CreateComboBox("",16,tab6_cy))
         return(false);
      AddToElementsArray(m_window_index,m_tab6_candles_candle_combo);
      m_tab6_candles_candle_combo.SelectItem(1);
      tab6_cy+=20+10;

      if(!CreateTextLabel(m_tab6_candles_refdist_label,"Distancia (pontos)",m_tab6_card_candles,m_window_index,m_tabs,5,16,tab6_cy,tab6_w-32,18))
         return(false);
      m_tab6_candles_refdist_label.FontSize(10);
      m_tab6_candles_refdist_label.LabelColor(C'91,78,64');
      tab6_cy+=18+2;

      m_tab6_candles_refdist_spin.MainPointer(m_tab6_card_candles);
      m_tabs.AddToElementsArray(5,m_tab6_candles_refdist_spin);
      m_tab6_candles_refdist_spin.XSize(tab6_cw);
      m_tab6_candles_refdist_spin.MaxValue(100000.0);
      m_tab6_candles_refdist_spin.MinValue(0.0);
      m_tab6_candles_refdist_spin.StepValue(1.0);
      m_tab6_candles_refdist_spin.SetDigits(1);
      m_tab6_candles_refdist_spin.SpinEditMode(true);
      m_tab6_candles_refdist_spin.CheckBoxMode(false);
      m_tab6_candles_refdist_spin.SetValue("0.0");
      m_tab6_candles_refdist_spin.AnchorBottomWindowSide(false);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().XSize(tab6_edit_w);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab6_candles_refdist_spin.CreateTextEdit("",16,tab6_cy))
         return(false);
      AddToElementsArray(m_window_index,m_tab6_candles_refdist_spin);
      m_tab6_candles_refdist_spin.BackColor(C'233,220,203');
      m_tab6_candles_refdist_spin.BackColorHover(C'233,220,203');
      m_tab6_candles_refdist_spin.BackColorPressed(C'233,220,203');
      m_tab6_candles_refdist_spin.BorderColor(tab2_border);
      m_tab6_candles_refdist_spin.BorderColorHover(tab2_border);
      m_tab6_candles_refdist_spin.BorderColorPressed(tab2_border);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab6_candles_refdist_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab6_candles_refdist_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab6_candles_refdist_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab6_candles_refdist_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab6_candles_refdist_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab6_candles_refdist_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab6_candles_refdist_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_candles_refdist_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab6_candles_refdist_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab6_candles_refdist_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab6_candles_refdist_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab6_candles_refdist_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab6_candles_refdist_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);

      // Tab 6: Trailing stop (indicador) card
      const int tab6_indic_card_x=content_pad + (card_w + card_gap) * 2;
      if(!CreateFrame(m_tab6_card_indicador,"",m_tabs,m_window_index,m_tabs,5,tab6_indic_card_x,tab6_y,tab6_w,tab6_h,1))
         return(false);
      m_tab6_card_indicador.BackColor(C'233,220,203');
      m_tab6_card_indicador.BorderColor(C'197,168,136');

      if(!CreateTextLabel(m_tab6_card_indicador_title,"Trailing stop (indicador)",m_tab6_card_indicador,m_window_index,m_tabs,5,16,12,tab6_w-32,22))
         return(false);
      m_tab6_card_indicador_title.FontSize(12);
      m_tab6_card_indicador_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab6_use_indicador,"Indicador",m_tab6_card_indicador,m_window_index,m_tabs,5,16,44,tab6_w-32,false,false,false))
         return(false);
      m_tab6_use_indicador.FontSize(10);
      m_tab6_use_indicador.LabelColor(C'43,43,43');

      const int tab6_icw=tab6_w-32;
      const int tab6_iedit_w=tab6_icw-34;
      int tab6_iy=76;

      if(!CreateTextLabel(m_tab6_indic_trigger_label,"Distancia para disparo",m_tab6_card_indicador,m_window_index,m_tabs,5,16,tab6_iy,tab6_w-32,18))
         return(false);
      m_tab6_indic_trigger_label.FontSize(10);
      m_tab6_indic_trigger_label.LabelColor(C'91,78,64');
      tab6_iy+=22;

      m_tab6_indic_trigger_spin.MainPointer(m_tab6_card_indicador);
      m_tabs.AddToElementsArray(5,m_tab6_indic_trigger_spin);
      m_tab6_indic_trigger_spin.XSize(tab6_icw);
      m_tab6_indic_trigger_spin.MaxValue(100000.0);
      m_tab6_indic_trigger_spin.MinValue(0.0);
      m_tab6_indic_trigger_spin.StepValue(0.1);
      m_tab6_indic_trigger_spin.SetDigits(1);
      m_tab6_indic_trigger_spin.SpinEditMode(true);
      m_tab6_indic_trigger_spin.CheckBoxMode(false);
      m_tab6_indic_trigger_spin.SetValue("1.0");
      m_tab6_indic_trigger_spin.AnchorBottomWindowSide(false);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().XSize(tab6_iedit_w);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().AutoSelectionMode(true);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().XGap(1);
      if(!m_tab6_indic_trigger_spin.CreateTextEdit("",16,tab6_iy))
         return(false);
      m_tab6_indic_trigger_spin.BackColor(C'233,220,203');
      m_tab6_indic_trigger_spin.BackColorHover(C'233,220,203');
      m_tab6_indic_trigger_spin.BackColorPressed(C'233,220,203');
      m_tab6_indic_trigger_spin.BorderColor(tab2_border);
      m_tab6_indic_trigger_spin.BorderColorHover(tab2_border);
      m_tab6_indic_trigger_spin.BorderColorPressed(tab2_border);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().BackColor(clrWhite);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().BackColorHover(clrWhite);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().BorderColor(tab2_border);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().BorderColorHover(tab2_border);
      m_tab6_indic_trigger_spin.GetTextBoxPointer().BorderColorPressed(tab2_border);
      m_tab6_indic_trigger_spin.GetIncButtonPointer().BackColor(clrWhite);
      m_tab6_indic_trigger_spin.GetIncButtonPointer().BackColorHover(clrWhite);
      m_tab6_indic_trigger_spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      m_tab6_indic_trigger_spin.GetIncButtonPointer().BorderColor(tab2_border);
      m_tab6_indic_trigger_spin.GetIncButtonPointer().BorderColorHover(tab2_border);
      m_tab6_indic_trigger_spin.GetIncButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_indic_trigger_spin.GetDecButtonPointer().BackColor(clrWhite);
      m_tab6_indic_trigger_spin.GetDecButtonPointer().BackColorHover(clrWhite);
      m_tab6_indic_trigger_spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      m_tab6_indic_trigger_spin.GetDecButtonPointer().BorderColor(tab2_border);
      m_tab6_indic_trigger_spin.GetDecButtonPointer().BorderColorHover(tab2_border);
      m_tab6_indic_trigger_spin.GetDecButtonPointer().BorderColorPressed(tab2_border);
      AddToElementsArray(m_window_index,m_tab6_indic_trigger_spin);
      tab6_iy+=34;

      if(!CreateTextLabel(m_tab6_indic_combo_label,"Indicador",m_tab6_card_indicador,m_window_index,m_tabs,5,16,tab6_iy,tab6_w-32,18))
         return(false);
      m_tab6_indic_combo_label.FontSize(10);
      m_tab6_indic_combo_label.LabelColor(C'91,78,64');
      tab6_iy+=22;

      string tab6_indic_items[];
      ArrayResize(tab6_indic_items,2);
      tab6_indic_items[0]="Media movel";
      tab6_indic_items[1]="Parabolic SAR";

      m_tab6_indic_combo.MainPointer(m_tab6_card_indicador);
      m_tabs.AddToElementsArray(5,m_tab6_indic_combo);
      m_tab6_indic_combo.XSize(tab6_icw);
      m_tab6_indic_combo.YSize(20);
      m_tab6_indic_combo.BackColor(clrWhite);
      m_tab6_indic_combo.BackColorHover(clrWhite);
      m_tab6_indic_combo.BackColorPressed(clrWhite);
      m_tab6_indic_combo.BorderColor(tab2_border);
      m_tab6_indic_combo.BorderColorHover(tab2_border);
      m_tab6_indic_combo.BorderColorPressed(tab2_border);
      m_tab6_indic_combo.FontSize(10);
      m_tab6_indic_combo.ItemsTotal(ArraySize(tab6_indic_items));
      m_tab6_indic_combo.CheckBoxMode(false);
      m_tab6_indic_combo.GetButtonPointer().XGap(1);
      m_tab6_indic_combo.GetButtonPointer().XSize(tab6_icw-2);
      m_tab6_indic_combo.GetButtonPointer().YSize(20);
      m_tab6_indic_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab6_indic_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab6_indic_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab6_indic_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab6_indic_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab6_indic_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab6_indic_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab6_indic_combo.GetButtonPointer().IconXGap((tab6_icw-2)-18);
      m_tab6_indic_combo.GetButtonPointer().LabelXGap(10);
      m_tab6_indic_combo.GetButtonPointer().LabelColor(C'43,43,43');
      m_tab6_indic_combo.GetListViewPointer().LightsHover(true);
      m_tab6_indic_combo.GetListViewPointer().BackColor(clrWhite);
      for(int i=0;i<ArraySize(tab6_indic_items);i++) m_tab6_indic_combo.SetValue(i,tab6_indic_items[i]);
      if(!m_tab6_indic_combo.CreateComboBox("",16,tab6_iy))
         return(false);
      AddToElementsArray(m_window_index,m_tab6_indic_combo);
      m_tab6_indic_combo.SelectItem(0);

      // Tab 7 (Saidas parciais): combobox padrao
      if(!CreateTextLabel(m_tab7_padrao_label,"Padrao",m_tabs,m_window_index,m_tabs,6,content_pad,content_y+66,card_w,18))
         return(false);
      m_tab7_padrao_label.FontSize(10);
      m_tab7_padrao_label.LabelColor(C'91,78,64');

      string items_tab7_padrao[];
      ArrayResize(items_tab7_padrao,2);
      items_tab7_padrao[0]="Pontos";
      items_tab7_padrao[1]="Percentual";

      m_tab7_padrao_combo.MainPointer(m_tabs);
      m_tabs.AddToElementsArray(6,m_tab7_padrao_combo);
      m_tab7_padrao_combo.XSize(260);
      m_tab7_padrao_combo.YSize(20);
      m_tab7_padrao_combo.BackColor(clrWhite);
      m_tab7_padrao_combo.BackColorHover(clrWhite);
      m_tab7_padrao_combo.BackColorPressed(clrWhite);
      m_tab7_padrao_combo.BorderColor(tab2_border);
      m_tab7_padrao_combo.BorderColorHover(tab2_border);
      m_tab7_padrao_combo.BorderColorPressed(tab2_border);
      m_tab7_padrao_combo.FontSize(10);
      m_tab7_padrao_combo.ItemsTotal(ArraySize(items_tab7_padrao));
      m_tab7_padrao_combo.CheckBoxMode(false);
      m_tab7_padrao_combo.GetButtonPointer().XGap(1);
      m_tab7_padrao_combo.GetButtonPointer().XSize(258);
      m_tab7_padrao_combo.GetButtonPointer().YSize(20);
      m_tab7_padrao_combo.GetButtonPointer().AnchorRightWindowSide(false);
      m_tab7_padrao_combo.GetButtonPointer().BackColor(clrWhite);
      m_tab7_padrao_combo.GetButtonPointer().BackColorHover(clrWhite);
      m_tab7_padrao_combo.GetButtonPointer().BackColorPressed(clrWhite);
      m_tab7_padrao_combo.GetButtonPointer().BorderColor(tab2_border);
      m_tab7_padrao_combo.GetButtonPointer().BorderColorHover(tab2_border);
      m_tab7_padrao_combo.GetButtonPointer().BorderColorPressed(tab2_border);
      m_tab7_padrao_combo.GetButtonPointer().IconXGap(258-18);
      m_tab7_padrao_combo.GetButtonPointer().LabelXGap(10);
      m_tab7_padrao_combo.GetButtonPointer().LabelColor(C'43,43,43');
      for(int i=0;i<ArraySize(items_tab7_padrao);i++) m_tab7_padrao_combo.SetValue(i,items_tab7_padrao[i]);
      m_tab7_padrao_combo.GetListViewPointer().YSize(80);
      m_tab7_padrao_combo.GetListViewPointer().LightsHover(true);
      m_tab7_padrao_combo.GetListViewPointer().BackColor(clrWhite);
      if(!m_tab7_padrao_combo.CreateComboBox("",content_pad,content_y+88))
         return(false);
      AddToElementsArray(m_window_index,m_tab7_padrao_combo);
      m_tab7_padrao_combo.SelectItem(0);

      m_top_tabs.SelectTab(0);
      m_top_tabs.ShowTabElements();
      m_tabs.SelectTab(0);
      m_tabs.ShowTabElements();
      m_top_tab_last=0;

      // Sync current EA settings -> EasyPanel controls
      LoadSettingsToControls(g_settings);
      UpdateSignalUI();
      // Ensure reference/media toggles are mutually exclusive on startup
      if(m_tab2_calc_ref_check.IsPressed())
        {
         m_tab2_calc_media_check.IsPressed(false);
         m_tab2_calc_maxmin_check.IsPressed(false);
        }
      else if(m_tab2_calc_media_check.IsPressed())
         m_tab2_calc_maxmin_check.IsPressed(false);

      // Ensure reference/media toggles for Tab 4 are mutually exclusive on startup
      if(m_tab4_calc_ref_check.IsPressed())
        {
         m_tab4_calc_media_check.IsPressed(false);
         m_tab4_calc_maxmin_check.IsPressed(false);
        }
      else if(m_tab4_calc_media_check.IsPressed())
         m_tab4_calc_maxmin_check.IsPressed(false);

      CompletedGUI();
      m_created=true;
      return(true);
     }

   bool ShowPanel(void)
     {
      if(!CreateIfNeeded())
         return(false);
      // Always reload (CPanel may have changed g_settings while EasyPanel was hidden)
      LoadSettingsToControls(g_settings);
      UpdateSignalUI();
      Show((uint)m_window_index);
      m_top_tabs.ShowTabElements();
      if(m_top_tabs.SelectedTab()==0)
         m_tabs.ShowTabElements();
      m_visible=true;
      return(true);
     }

   void HidePanel(void)
     {
      if(!m_created)
         return;
      Hide();
      m_visible=false;
     }

   bool Toggle(void)
     {
      if(m_visible)
        {
         HidePanel();
         return(true);
        }
      return(ShowPanel());
     }

   void Shutdown(void)
     {
      if(!m_created)
         return;
      Destroy();
      m_created=false;
      m_visible=false;
      m_window_index=-1;
      m_top_tab_last=-1;
     }

   void ChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      CEF_CWndCreate::ChartEvent(id,lparam,dparam,sparam);
      if(!m_created || !m_visible)
         return;

      if(id==CHARTEVENT_CUSTOM+ON_CLICK_CHECKBOX)
        {
         const int clicked_id=(int)lparam;
         bool handled=false;
         for(int i=1; i<EASY_TAB_COUNT; i++)
           {
            if(m_tab_signal_buy[i].Id()==clicked_id)
              {
               m_signal_is_buy=true;
               handled=true;
               break;
              }
            if(m_tab_signal_sell[i].Id()==clicked_id)
              {
               m_signal_is_buy=false;
               handled=true;
               break;
              }
           }
         if(handled)
           {
            UpdateSignalUI();
            return;
           }

         // Stop loss (tab 2) mutually exclusive options
         if(m_tab2_use_fixed.Id()==clicked_id)
           {
            if(m_tab2_use_fixed.IsPressed())
              {
               m_tab2_use_calc.IsPressed(false);
               m_tab2_use_mult.IsPressed(false);
              }
            m_tab2_use_fixed.Update(true);
            m_tab2_use_calc.Update(true);
            m_tab2_use_mult.Update(true);
            return;
           }
         if(m_tab2_use_calc.Id()==clicked_id)
           {
            if(m_tab2_use_calc.IsPressed())
              {
               m_tab2_use_fixed.IsPressed(false);
               m_tab2_use_mult.IsPressed(false);
              }
            m_tab2_use_calc.Update(true);
            m_tab2_use_fixed.Update(true);
            m_tab2_use_mult.Update(true);
            return;
           }

         if(m_tab2_use_mult.Id()==clicked_id)
           {
            if(m_tab2_use_mult.IsPressed())
              {
               m_tab2_use_fixed.IsPressed(false);
               m_tab2_use_calc.IsPressed(false);
              }
            m_tab2_use_mult.Update(true);
            m_tab2_use_fixed.Update(true);
            m_tab2_use_calc.Update(true);
            return;
           }

         // Take profit (tab 4) mutually exclusive options
         if(m_tab4_use_fixed.Id()==clicked_id)
           {
            if(m_tab4_use_fixed.IsPressed())
              {
               m_tab4_use_calc.IsPressed(false);
               m_tab4_use_mult.IsPressed(false);
               m_tab4_use_indicador.IsPressed(false);
              }
            m_tab4_use_fixed.Update(true);
            m_tab4_use_calc.Update(true);
            m_tab4_use_mult.Update(true);
            m_tab4_use_indicador.Update(true);
            return;
           }
         if(m_tab4_use_calc.Id()==clicked_id)
           {
            if(m_tab4_use_calc.IsPressed())
              {
               m_tab4_use_fixed.IsPressed(false);
               m_tab4_use_mult.IsPressed(false);
               m_tab4_use_indicador.IsPressed(false);
              }
            m_tab4_use_calc.Update(true);
            m_tab4_use_fixed.Update(true);
            m_tab4_use_mult.Update(true);
            m_tab4_use_indicador.Update(true);
            return;
           }
         if(m_tab4_use_mult.Id()==clicked_id)
           {
            if(m_tab4_use_mult.IsPressed())
              {
               m_tab4_use_fixed.IsPressed(false);
               m_tab4_use_calc.IsPressed(false);
               m_tab4_use_indicador.IsPressed(false);
              }
            m_tab4_use_mult.Update(true);
            m_tab4_use_fixed.Update(true);
            m_tab4_use_calc.Update(true);
            m_tab4_use_indicador.Update(true);
            return;
           }
         if(m_tab4_use_indicador.Id()==clicked_id)
           {
            if(m_tab4_use_indicador.IsPressed())
              {
               m_tab4_use_fixed.IsPressed(false);
               m_tab4_use_calc.IsPressed(false);
               m_tab4_use_mult.IsPressed(false);
              }
            m_tab4_use_indicador.Update(true);
            m_tab4_use_fixed.Update(true);
            m_tab4_use_calc.Update(true);
            m_tab4_use_mult.Update(true);
            return;
           }

         if(m_tab2_calc_ref_check.Id()==clicked_id)
           {
            if(m_tab2_calc_ref_check.IsPressed())
              {
               m_tab2_calc_media_check.IsPressed(false);
               m_tab2_calc_maxmin_check.IsPressed(false);
              }
            m_tab2_calc_ref_check.Update(true);
            m_tab2_calc_media_check.Update(true);
            m_tab2_calc_maxmin_check.Update(true);
            return;
           }
         if(m_tab2_calc_media_check.Id()==clicked_id)
           {
            if(m_tab2_calc_media_check.IsPressed())
              {
               m_tab2_calc_ref_check.IsPressed(false);
               m_tab2_calc_maxmin_check.IsPressed(false);
              }
            m_tab2_calc_media_check.Update(true);
            m_tab2_calc_ref_check.Update(true);
            m_tab2_calc_maxmin_check.Update(true);
            return;
           }
         if(m_tab2_calc_maxmin_check.Id()==clicked_id)
           {
            if(m_tab2_calc_maxmin_check.IsPressed())
              {
               m_tab2_calc_ref_check.IsPressed(false);
               m_tab2_calc_media_check.IsPressed(false);
              }
            m_tab2_calc_maxmin_check.Update(true);
            m_tab2_calc_ref_check.Update(true);
            m_tab2_calc_media_check.Update(true);
            return;
           }
         if(m_tab4_calc_ref_check.Id()==clicked_id)
           {
            if(m_tab4_calc_ref_check.IsPressed())
              {
               m_tab4_calc_media_check.IsPressed(false);
               m_tab4_calc_maxmin_check.IsPressed(false);
              }
            m_tab4_calc_ref_check.Update(true);
            m_tab4_calc_media_check.Update(true);
            m_tab4_calc_maxmin_check.Update(true);
            return;
           }
         if(m_tab4_calc_media_check.Id()==clicked_id)
           {
            if(m_tab4_calc_media_check.IsPressed())
              {
               m_tab4_calc_ref_check.IsPressed(false);
               m_tab4_calc_maxmin_check.IsPressed(false);
              }
            m_tab4_calc_media_check.Update(true);
            m_tab4_calc_ref_check.Update(true);
            m_tab4_calc_maxmin_check.Update(true);
            return;
           }
         if(m_tab4_calc_maxmin_check.Id()==clicked_id)
           {
            if(m_tab4_calc_maxmin_check.IsPressed())
              {
               m_tab4_calc_ref_check.IsPressed(false);
               m_tab4_calc_media_check.IsPressed(false);
              }
            m_tab4_calc_maxmin_check.Update(true);
            m_tab4_calc_ref_check.Update(true);
            m_tab4_calc_media_check.Update(true);
            return;
           }
         if(m_tab2_calc_media_check.Id()==clicked_id)
           {
            if(m_tab2_calc_media_check.IsPressed())
              {
               m_tab2_calc_ref_check.IsPressed(false);
               m_tab2_calc_maxmin_check.IsPressed(false);
              }
            m_tab2_calc_media_check.Update(true);
            m_tab2_calc_ref_check.Update(true);
            m_tab2_calc_maxmin_check.Update(true);
            return;
           }
         if(m_tab2_calc_maxmin_check.Id()==clicked_id)
           {
            if(m_tab2_calc_maxmin_check.IsPressed())
              {
               m_tab2_calc_ref_check.IsPressed(false);
               m_tab2_calc_media_check.IsPressed(false);
              }
            m_tab2_calc_maxmin_check.Update(true);
            m_tab2_calc_ref_check.Update(true);
            m_tab2_calc_media_check.Update(true);
            return;
           }

         // Stop movel (tab 3) mutually exclusive options
         if(m_tab3_use_padrao.Id()==clicked_id)
           {
            if(m_tab3_use_padrao.IsPressed())
              {
               m_tab3_use_candles.IsPressed(false);
               m_tab3_use_indicador.IsPressed(false);
              }
            m_tab3_use_padrao.Update(true);
            m_tab3_use_candles.Update(true);
            m_tab3_use_indicador.Update(true);
            return;
           }
         if(m_tab3_use_candles.Id()==clicked_id)
           {
            if(m_tab3_use_candles.IsPressed())
              {
               m_tab3_use_padrao.IsPressed(false);
               m_tab3_use_indicador.IsPressed(false);
              }
            m_tab3_use_candles.Update(true);
            m_tab3_use_padrao.Update(true);
            m_tab3_use_indicador.Update(true);
            return;
           }
         if(m_tab3_use_indicador.Id()==clicked_id)
           {
            if(m_tab3_use_indicador.IsPressed())
              {
               m_tab3_use_padrao.IsPressed(false);
               m_tab3_use_candles.IsPressed(false);
              }
            m_tab3_use_indicador.Update(true);
            m_tab3_use_padrao.Update(true);
            m_tab3_use_candles.Update(true);
            return;
           }

         // Trailing stop (tab 6) mutually exclusive options
         if(m_tab6_use_padrao.Id()==clicked_id)
           {
            if(m_tab6_use_padrao.IsPressed())
              {
               m_tab6_use_candles.IsPressed(false);
               m_tab6_use_indicador.IsPressed(false);
              }
            m_tab6_use_padrao.Update(true);
            m_tab6_use_candles.Update(true);
            m_tab6_use_indicador.Update(true);
            return;
           }
         if(m_tab6_use_candles.Id()==clicked_id)
           {
            if(m_tab6_use_candles.IsPressed())
              {
               m_tab6_use_padrao.IsPressed(false);
               m_tab6_use_indicador.IsPressed(false);
              }
            m_tab6_use_candles.Update(true);
            m_tab6_use_padrao.Update(true);
            m_tab6_use_indicador.Update(true);
            return;
           }
         if(m_tab6_use_indicador.Id()==clicked_id)
           {
            if(m_tab6_use_indicador.IsPressed())
              {
               m_tab6_use_padrao.IsPressed(false);
               m_tab6_use_candles.IsPressed(false);
              }
            m_tab6_use_indicador.Update(true);
            m_tab6_use_padrao.Update(true);
            m_tab6_use_candles.Update(true);
            return;
           }

        }

      if(id==CHARTEVENT_CUSTOM+ON_CLICK_BUTTON)
        {
         if(m_btn_refresh.CheckElementName(sparam))
           {
            // Apply EasyPanel -> EA settings (same role as CPanel "Executar")
            StoreControlsToSettings(g_settings);
            Print("Easy GUI: configuracao aplicada pelo painel");
            m_tabs.Update();
            m_tabs.ShowTabElements();
            return;
           }
        }

      const int top_selected=m_top_tabs.SelectedTab();
      if(top_selected!=m_top_tab_last)
        {
         m_top_tab_last=top_selected;
         if(top_selected==0)
            m_tabs.ShowTabElements();
        }
     }
  };

#endif // __CONSTRUTOR_EASY_PANEL_MQH__
