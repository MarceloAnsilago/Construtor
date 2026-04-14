//+------------------------------------------------------------------+
//|                                           ConstrutorDialog.mqh   |
//|                       Base inicial da interface do Construtor    |
//+------------------------------------------------------------------+
#ifndef __CONSTRUTOR_DIALOG_MQH__
#define __CONSTRUTOR_DIALOG_MQH__

#include <Controls\Dialog.mqh>
#include <Controls\Panel.mqh>
#include <Controls\Button.mqh>
#include <Controls\Label.mqh>
#include <Controls\Edit.mqh>
#include <Controls\ComboBox.mqh>
#include <Controls\CheckBox.mqh>
#include <Controls\SpinEdit.mqh>

enum ENUM_CONSTRUTOR_MERCADO
  {
   CONSTRUTOR_MERCADO_B3=0,
   CONSTRUTOR_MERCADO_FOREX=1
  };

enum ENUM_CONSTRUTOR_TIPO_OPERACIONAL
  {
   CONSTRUTOR_TIPO_DAY_TRADE=0,
   CONSTRUTOR_TIPO_SWING_TRADE=1
  };

enum ENUM_CONSTRUTOR_MODO_PROCESSAMENTO
  {
   CONSTRUTOR_MODO_CADA_TICK=0,
   CONSTRUTOR_MODO_CADA_SEGUNDO=1
  };

enum ENUM_CONSTRUTOR_TEMPO_GRAFICO
  {
   CONSTRUTOR_CORRENTE=0,
   CONSTRUTOR_M1=1,
   CONSTRUTOR_M2=2,
   CONSTRUTOR_M3=3,
   CONSTRUTOR_M4=4,
   CONSTRUTOR_M5=5,
   CONSTRUTOR_M6=6,
   CONSTRUTOR_M10=7,
   CONSTRUTOR_M12=8,
   CONSTRUTOR_M15=9,
   CONSTRUTOR_M30=10,
   CONSTRUTOR_H1=11,
   CONSTRUTOR_H2=12,
   CONSTRUTOR_H3=13,
   CONSTRUTOR_H4=14,
   CONSTRUTOR_H6=15,
   CONSTRUTOR_H8=16,
   CONSTRUTOR_H12=17,
   CONSTRUTOR_D1=18,
   CONSTRUTOR_W1=19,
   CONSTRUTOR_MN1=20
  };

enum ENUM_CONSTRUTOR_SIM_NAO
  {
   CONSTRUTOR_NAO=0,
   CONSTRUTOR_SIM=1
  };

enum ENUM_CONSTRUTOR_TIPO_STOP_LOSS
  {
   CONSTRUTOR_STOP_PONTOS=0,
   CONSTRUTOR_STOP_PERCENTUAL=1
  };

enum ENUM_CONSTRUTOR_BASE_MEDIA
  {
   CONSTRUTOR_MEDIA_MAXIMA=0,
   CONSTRUTOR_MEDIA_MINIMA=1,
   CONSTRUTOR_MEDIA_ABERTURA=2,
   CONSTRUTOR_MEDIA_FECHAMENTO=3
  };

struct SConstrutorSettings
  {
   string                       estrategia_nome;
   ENUM_CONSTRUTOR_MERCADO      mercado;
   ENUM_CONSTRUTOR_TIPO_OPERACIONAL tipo_operacional;
   ENUM_CONSTRUTOR_MODO_PROCESSAMENTO modo_processamento;
   ENUM_CONSTRUTOR_SIM_NAO      operar_compra;
   ENUM_CONSTRUTOR_SIM_NAO      operar_venda;
   int                          inicio_hora;
   int                          inicio_minuto;
   int                          fim_hora;
   int                          fim_minuto;
   ENUM_CONSTRUTOR_SIM_NAO      zerar_posicoes;
   string                       horario_zeragem;
   ENUM_CONSTRUTOR_TEMPO_GRAFICO tempo_grafico;
   double                       volume_inicial;
   int                          spread_maximo;
   ENUM_CONSTRUTOR_SIM_NAO      usar_stop_loss;
   ENUM_CONSTRUTOR_TIPO_STOP_LOSS tipo_stop_loss;
   ENUM_CONSTRUTOR_SIM_NAO      stop_fixo;
   ENUM_CONSTRUTOR_SIM_NAO      stop_calculo;
   ENUM_CONSTRUTOR_SIM_NAO      stop_calculo_media;
   ENUM_CONSTRUTOR_SIM_NAO      stop_calculo_multiplicar;
   int                          stop_calculo_media_qtd_candles;
   ENUM_CONSTRUTOR_BASE_MEDIA   stop_calculo_media_base;
   double                       stop_fixo_distancia;
  };

extern SConstrutorSettings g_settings;

class CConstrutorDialog : public CAppDialog
  {
private:
   enum
     {
      TAB_COUNT=11
     };

   CPanel            m_sidebar;
   CPanel            m_content;
   CButton           m_tabs[TAB_COUNT];
   CLabel            m_page_title;
   CLabel            m_page_note;
   CButton           m_execute_button;
   CWndContainer     m_tab1_page;
   CWndContainer     m_tab2_page;
   CWndContainer     m_tab3_page;
   CWndContainer     m_tab4_page;
   CPanel            m_tab1_card_left;
   CPanel            m_tab1_card_right;
   CLabel            m_tab1_card_left_title;
   CLabel            m_tab1_card_right_title;
   CLabel            m_tab1_name_label;
   CEdit             m_tab1_name_edit;
   CLabel            m_tab1_market_label;
   CComboBox         m_tab1_market_combo;
   CLabel            m_tab1_oper_label;
   CComboBox         m_tab1_oper_combo;
   CLabel            m_tab1_mode_label;
   CComboBox         m_tab1_mode_combo;
   CLabel            m_tab1_buy_label;
   CComboBox         m_tab1_buy_combo;
   CLabel            m_tab1_sell_label;
   CComboBox         m_tab1_sell_combo;
   CPanel            m_tab2_card_left;
   CPanel            m_tab2_card_right;
   CLabel            m_tab2_card_left_title;
   CLabel            m_tab2_card_right_title;
   CLabel            m_tab2_start_label;
   CLabel            m_tab2_start_hour_label;
   CComboBox         m_tab2_start_hour_combo;
   CLabel            m_tab2_start_min_label;
   CComboBox         m_tab2_start_min_combo;
   CLabel            m_tab2_end_label;
   CLabel            m_tab2_end_hour_label;
   CComboBox         m_tab2_end_hour_combo;
   CLabel            m_tab2_end_min_label;
   CComboBox         m_tab2_end_min_combo;
   CLabel            m_tab2_zero_label;
   CComboBox         m_tab2_zero_combo;
   CLabel            m_tab2_zero_time_label;
   CEdit             m_tab2_zero_time_edit;
   CPanel            m_tab3_card;
   CLabel            m_tab3_card_title;
   CLabel            m_tab3_tempo_label;
   CComboBox         m_tab3_tempo_combo;
   CLabel            m_tab3_volume_label;
   CEdit             m_tab3_volume_edit;
   CLabel            m_tab3_spread_label;
   CEdit             m_tab3_spread_edit;
   CPanel            m_tab4_card;
   CLabel            m_tab4_card_title;
   CLabel            m_tab4_use_label;
   CComboBox         m_tab4_use_combo;
   CLabel            m_tab4_type_label;
   CComboBox         m_tab4_type_combo;
   CPanel            m_tab4_card_fixed;
   CLabel            m_tab4_card_fixed_title;
   CCheckBox         m_tab4_card_fixed_check;
   CLabel            m_tab4_card_fixed_dist_label;
   CEdit             m_tab4_card_fixed_dist_edit;
   CPanel            m_tab4_card_calc;
   CPanel            m_tab4_card_calc_inner;
   CPanel            m_tab4_card_calc_inner_left;
   CPanel            m_tab4_card_calc_mode_card;
   CCheckBox         m_tab4_card_calc_mode_outer_check;
   CCheckBox         m_tab4_card_calc_mode_check;
   CLabel            m_tab4_card_calc_mode_qty_label;
   CSpinEdit         m_tab4_card_calc_mode_qty_spin;
   CLabel            m_tab4_card_calc_mode_base_label;
   CComboBox         m_tab4_card_calc_mode_base_combo;
   CCheckBox         m_tab4_card_calc_check;
   CPanel            m_tab4_card_calc_ref_card;
   CCheckBox         m_tab4_card_calc_ref_outer_check;
   CCheckBox         m_tab4_card_calc_ref_check;
   int               m_active_tab;
   string            m_tab_titles[TAB_COUNT];
   string            m_tab_notes[TAB_COUNT];
   SConstrutorSettings m_settings;
   bool              m_settings_bound;
   bool              m_tab4_updating_checks;

public:
                     CConstrutorDialog(void);
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   virtual void      Destroy(const int reason=REASON_PROGRAM);
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);
   void              BindSettings(const SConstrutorSettings &settings);

private:
   void              InitTabData(void);
   bool              CreateLayout(void);
   bool              CreateSidebar(void);
   bool              CreateContent(void);
   bool              CreateTabs(void);
   bool              CreateTab1(void);
   bool              CreateTab2(void);
   bool              CreateTab3(void);
   bool              CreateTab4(void);
   bool              CreateExecuteButton(void);
   void              SetTab1Visible(const bool visible);
   void              SetTab2Visible(const bool visible);
   void              SetTab3Visible(const bool visible);
   void              SetTab4Visible(const bool visible);
   void              SyncTab4Visibility(void);
   void              SelectTab(const int index);
   void              UpdateTabVisuals(void);
   void              LoadSettingsToControls(void);
   void              StoreControlsToSettings(void);
   bool              OnTabClick(const int index);
   bool              OnExecuteClick(void);
   bool              OnTab4FixedChange(void);
   bool              OnTab4CalcChange(void);
   bool              OnTab4CalcModeOuterChange(void);
   bool              OnTab4CalcRefOuterChange(void);
   bool              OnTab4CalcModeChange(void);
   bool              OnTab4CalcRefChange(void);
  };

EVENT_MAP_BEGIN(CConstrutorDialog)
   ON_EVENT(ON_CLICK,m_execute_button,OnExecuteClick)
   ON_INDEXED_EVENT(ON_CLICK,m_tabs,OnTabClick)
   ON_EVENT(ON_CHANGE,m_tab4_card_fixed_check,OnTab4FixedChange)
   ON_EVENT(ON_CHANGE,m_tab4_card_calc_check,OnTab4CalcChange)
   ON_EVENT(ON_CHANGE,m_tab4_card_calc_mode_outer_check,OnTab4CalcModeOuterChange)
   ON_EVENT(ON_CHANGE,m_tab4_card_calc_ref_outer_check,OnTab4CalcRefOuterChange)
   ON_EVENT(ON_CHANGE,m_tab4_card_calc_mode_check,OnTab4CalcModeChange)
   ON_EVENT(ON_CHANGE,m_tab4_card_calc_ref_check,OnTab4CalcRefChange)
EVENT_MAP_END(CAppDialog)

CConstrutorDialog::CConstrutorDialog(void) : m_active_tab(0), m_settings_bound(false), m_tab4_updating_checks(false)
  {
   InitTabData();
  }

void CConstrutorDialog::BindSettings(const SConstrutorSettings &settings)
  {
   m_settings=settings;
   m_settings_bound=true;
  }

void CConstrutorDialog::InitTabData(void)
  {
   m_tab_titles[0]="1. Inf. Iniciais";
   m_tab_titles[1]="2. Horario";
   m_tab_titles[2]="3. Conf. inicial";
   m_tab_titles[3]="4. Stop loss";
   m_tab_titles[4]="5. Stop movel";
   m_tab_titles[5]="6. Take profit";
   m_tab_titles[6]="7. Trailing stop";
   m_tab_titles[7]="8. Saidas parciais";
   m_tab_titles[8]="9. Sinais";
   m_tab_titles[9]="10. Ajustes finais";
   m_tab_titles[10]="11. Painel";

   m_tab_notes[0]="Base inicial do projeto e configuracao principal.";
   m_tab_notes[1]="Horarios de operacao e zeragem automatica.";
   m_tab_notes[2]="Tempo grafico, volume inicial e spread maximo.";
   m_tab_notes[3]="Parametros de protecao por perda.";
   m_tab_notes[3]="Stop loss fixo, calculo e protecao por perda.";
   m_tab_notes[4]="Regras para mover o stop automaticamente.";
   m_tab_notes[5]="Regras de objetivo e saida por ganho.";
   m_tab_notes[6]="Trailing stop e acompanhamento dinamico.";
   m_tab_notes[7]="Saidas fracionadas e gerenciamento parcial.";
   m_tab_notes[8]="Gatilhos e filtros de sinal.";
   m_tab_notes[9]="Acabamento final da estrategia.";
   m_tab_notes[10]="Painel geral da interface.";
  }

bool CConstrutorDialog::Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2)
  {
   if(!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))
      return(false);

   Caption("Construtor Visual | Arraste pelo topo");

   if(!CreateLayout())
      return(false);

   SelectTab(0);
   return(true);
  }

void CConstrutorDialog::Destroy(const int reason)
  {
   CAppDialog::Destroy(reason);
   m_active_tab=0;
  }

bool CConstrutorDialog::CreateLayout(void)
  {
   if(!CreateSidebar())
      return(false);
   if(!CreateContent())
      return(false);
   if(!CreateTabs())
      return(false);
   if(!CreateTab1())
      return(false);
   if(!CreateTab2())
      return(false);
   if(!CreateTab3())
      return(false);
   if(!CreateTab4())
      return(false);
   if(!CreateExecuteButton())
      return(false);
   LoadSettingsToControls();
   return(true);
  }

bool CConstrutorDialog::CreateSidebar(void)
  {
   const int x1=10;
   const int y1=10;
   const int x2=224;
   const int y2=586;

   if(!m_sidebar.Create(m_chart_id,"ConstrutorSidebar",m_subwin,x1,y1,x2,y2))
      return(false);
   m_sidebar.ColorBackground(C'27,38,59');
   m_sidebar.ColorBorder(C'18,29,43');
   m_sidebar.BorderType(BORDER_FLAT);
   if(!Add(m_sidebar))
      return(false);
   return(true);
  }

bool CConstrutorDialog::CreateContent(void)
  {
   const int x1=236;
   const int y1=10;
   const int x2=992;
   const int y2=586;

   if(!m_content.Create(m_chart_id,"ConstrutorContent",m_subwin,x1,y1,x2,y2))
      return(false);
   m_content.ColorBackground(C'247,241,231');
   m_content.ColorBorder(C'220,207,186');
   m_content.BorderType(BORDER_FLAT);
   if(!Add(m_content))
      return(false);

   if(!m_page_title.Create(m_chart_id,"ConstrutorPageTitle",m_subwin,260,32,0,0))
      return(false);
   m_page_title.FontSize(18);
   m_page_title.Color(C'43,43,43');
   if(!Add(m_page_title))
      return(false);

   if(!m_page_note.Create(m_chart_id,"ConstrutorPageNote",m_subwin,260,64,0,0))
      return(false);
   m_page_note.FontSize(10);
   m_page_note.Color(C'91,78,64');
   if(!Add(m_page_note))
      return(false);

   return(true);
  }

bool CConstrutorDialog::CreateTabs(void)
  {
   const int x1=24;
   const int x2=198;
   const int button_height=26;
   const int first_y=90;
   const int gap_y=6;

   for(int i=0; i<TAB_COUNT; i++)
     {
      int y1=first_y+i*(button_height+gap_y);
      int y2=y1+button_height;
      string name="ConstrutorTab_"+(string)(i+1);

      if(!m_tabs[i].Create(m_chart_id,name,m_subwin,x1,y1,x2,y2))
         return(false);

      m_tabs[i].Text(m_tab_titles[i]);
      m_tabs[i].FontSize(10);
      if(!Add(m_tabs[i]))
         return(false);
     }
   return(true);
  }

bool CConstrutorDialog::CreateTab1(void)
  {
   if(!m_tab1_page.Create(m_chart_id,"ConstrutorTab1Page",m_subwin,256,145,992,544))
      return(false);
   if(!Add(m_tab1_page))
      return(false);

   if(!m_tab1_card_left.Create(m_chart_id,"ConstrutorTab1CardLeft",m_subwin,0,0,348,399))
      return(false);
   m_tab1_card_left.ColorBackground(C'233,220,203');
   m_tab1_card_left.ColorBorder(C'197,168,136');
   m_tab1_card_left.BorderType(BORDER_FLAT);
   if(!m_tab1_page.Add(m_tab1_card_left))
      return(false);

   if(!m_tab1_card_right.Create(m_chart_id,"ConstrutorTab1CardRight",m_subwin,376,0,724,399))
      return(false);
   m_tab1_card_right.ColorBackground(C'233,220,203');
   m_tab1_card_right.ColorBorder(C'197,168,136');
   m_tab1_card_right.BorderType(BORDER_FLAT);
   if(!m_tab1_page.Add(m_tab1_card_right))
      return(false);

   if(!m_tab1_card_left_title.Create(m_chart_id,"ConstrutorTab1LeftTitle",m_subwin,20,17,0,0))
      return(false);
   m_tab1_card_left_title.Text("Informacoes basicas");
   m_tab1_card_left_title.FontSize(12);
   m_tab1_card_left_title.Color(C'43,43,43');
   if(!m_tab1_page.Add(m_tab1_card_left_title))
      return(false);

   if(!m_tab1_card_right_title.Create(m_chart_id,"ConstrutorTab1RightTitle",m_subwin,396,17,0,0))
      return(false);
   m_tab1_card_right_title.Text("Direcao operacional");
   m_tab1_card_right_title.FontSize(12);
   m_tab1_card_right_title.Color(C'43,43,43');
   if(!m_tab1_page.Add(m_tab1_card_right_title))
      return(false);

   if(!m_tab1_name_label.Create(m_chart_id,"ConstrutorTab1NameLabel",m_subwin,20,57,0,0))
      return(false);
   m_tab1_name_label.Text("Nome da estrategia");
   m_tab1_name_label.FontSize(10);
   m_tab1_name_label.Color(C'91,78,64');
   if(!m_tab1_page.Add(m_tab1_name_label))
      return(false);

   if(!m_tab1_name_edit.Create(m_chart_id,"ConstrutorTab1NameEdit",m_subwin,20,79,316,103))
      return(false);
   m_tab1_name_edit.Text("Minha estrategia");
   m_tab1_name_edit.FontSize(10);
   if(!m_tab1_page.Add(m_tab1_name_edit))
      return(false);

   if(!m_tab1_market_label.Create(m_chart_id,"ConstrutorTab1MarketLabel",m_subwin,20,119,0,0))
      return(false);
   m_tab1_market_label.Text("Mercado desejado");
   m_tab1_market_label.FontSize(10);
   m_tab1_market_label.Color(C'91,78,64');
   if(!m_tab1_page.Add(m_tab1_market_label))
      return(false);

   if(!m_tab1_market_combo.Create(m_chart_id,"ConstrutorTab1MarketCombo",m_subwin,20,141,316,165))
      return(false);
   m_tab1_market_combo.AddItem("B3",0);
   m_tab1_market_combo.AddItem("Forex",1);
   m_tab1_market_combo.Select(0);
   if(!m_tab1_page.Add(m_tab1_market_combo))
      return(false);

   if(!m_tab1_oper_label.Create(m_chart_id,"ConstrutorTab1OperLabel",m_subwin,20,185,0,0))
      return(false);
   m_tab1_oper_label.Text("Tipo operacional");
   m_tab1_oper_label.FontSize(10);
   m_tab1_oper_label.Color(C'91,78,64');
   if(!m_tab1_page.Add(m_tab1_oper_label))
      return(false);

   if(!m_tab1_oper_combo.Create(m_chart_id,"ConstrutorTab1OperCombo",m_subwin,20,207,316,231))
      return(false);
   m_tab1_oper_combo.AddItem("Day trade",0);
   m_tab1_oper_combo.AddItem("Swing trade",1);
   m_tab1_oper_combo.Select(0);
   if(!m_tab1_page.Add(m_tab1_oper_combo))
      return(false);

   if(!m_tab1_mode_label.Create(m_chart_id,"ConstrutorTab1ModeLabel",m_subwin,20,251,0,0))
      return(false);
   m_tab1_mode_label.Text("Modo de processamento");
   m_tab1_mode_label.FontSize(10);
   m_tab1_mode_label.Color(C'91,78,64');
   if(!m_tab1_page.Add(m_tab1_mode_label))
      return(false);

   if(!m_tab1_mode_combo.Create(m_chart_id,"ConstrutorTab1ModeCombo",m_subwin,20,273,316,297))
      return(false);
   m_tab1_mode_combo.AddItem("Cada tick",0);
   m_tab1_mode_combo.AddItem("Cada segundo",1);
   m_tab1_mode_combo.Select(0);
   if(!m_tab1_page.Add(m_tab1_mode_combo))
      return(false);

   if(!m_tab1_buy_label.Create(m_chart_id,"ConstrutorTab1BuyLabel",m_subwin,396,57,0,0))
      return(false);
   m_tab1_buy_label.Text("Operar na compra");
   m_tab1_buy_label.FontSize(10);
   m_tab1_buy_label.Color(C'91,78,64');
   if(!m_tab1_page.Add(m_tab1_buy_label))
      return(false);

   if(!m_tab1_buy_combo.Create(m_chart_id,"ConstrutorTab1BuyCombo",m_subwin,396,79,700,103))
      return(false);
   m_tab1_buy_combo.AddItem("Sim",0);
   m_tab1_buy_combo.AddItem("Nao",1);
   m_tab1_buy_combo.Select(0);
   if(!m_tab1_page.Add(m_tab1_buy_combo))
      return(false);

   if(!m_tab1_sell_label.Create(m_chart_id,"ConstrutorTab1SellLabel",m_subwin,396,131,0,0))
      return(false);
   m_tab1_sell_label.Text("Operar na venda");
   m_tab1_sell_label.FontSize(10);
   m_tab1_sell_label.Color(C'91,78,64');
   if(!m_tab1_page.Add(m_tab1_sell_label))
      return(false);

   if(!m_tab1_sell_combo.Create(m_chart_id,"ConstrutorTab1SellCombo",m_subwin,396,153,700,177))
      return(false);
   m_tab1_sell_combo.AddItem("Sim",0);
   m_tab1_sell_combo.AddItem("Nao",1);
   m_tab1_sell_combo.Select(0);
   if(!m_tab1_page.Add(m_tab1_sell_combo))
      return(false);

   SetTab1Visible(true);
   return(true);
  }

bool CConstrutorDialog::CreateTab2(void)
  {
   if(!m_tab2_page.Create(m_chart_id,"ConstrutorTab2Page",m_subwin,256,145,992,544))
      return(false);
   if(!Add(m_tab2_page))
      return(false);

   if(!m_tab2_card_left.Create(m_chart_id,"ConstrutorTab2CardLeft",m_subwin,0,0,348,399))
      return(false);
   m_tab2_card_left.ColorBackground(C'233,220,203');
   m_tab2_card_left.ColorBorder(C'197,168,136');
   m_tab2_card_left.BorderType(BORDER_FLAT);
   if(!m_tab2_page.Add(m_tab2_card_left))
      return(false);

   if(!m_tab2_card_right.Create(m_chart_id,"ConstrutorTab2CardRight",m_subwin,376,0,724,399))
      return(false);
   m_tab2_card_right.ColorBackground(C'233,220,203');
   m_tab2_card_right.ColorBorder(C'197,168,136');
   m_tab2_card_right.BorderType(BORDER_FLAT);
   if(!m_tab2_page.Add(m_tab2_card_right))
      return(false);

   if(!m_tab2_card_left_title.Create(m_chart_id,"ConstrutorTab2LeftTitle",m_subwin,20,17,0,0))
      return(false);
   m_tab2_card_left_title.Text("Horario de operacoes");
   m_tab2_card_left_title.FontSize(12);
   m_tab2_card_left_title.Color(C'43,43,43');
   if(!m_tab2_page.Add(m_tab2_card_left_title))
      return(false);

   if(!m_tab2_card_right_title.Create(m_chart_id,"ConstrutorTab2RightTitle",m_subwin,396,17,0,0))
      return(false);
   m_tab2_card_right_title.Text("Zeragem automatica");
   m_tab2_card_right_title.FontSize(12);
   m_tab2_card_right_title.Color(C'43,43,43');
   if(!m_tab2_page.Add(m_tab2_card_right_title))
      return(false);

   if(!m_tab2_start_label.Create(m_chart_id,"ConstrutorTab2StartLabel",m_subwin,20,57,0,0))
      return(false);
   m_tab2_start_label.Text("Inicio das operacoes");
   m_tab2_start_label.FontSize(10);
   m_tab2_start_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_start_label))
      return(false);

   if(!m_tab2_start_hour_label.Create(m_chart_id,"ConstrutorTab2StartHourLabel",m_subwin,20,79,0,0))
      return(false);
   m_tab2_start_hour_label.Text("Hora");
   m_tab2_start_hour_label.FontSize(9);
   m_tab2_start_hour_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_start_hour_label))
      return(false);

   if(!m_tab2_start_hour_combo.Create(m_chart_id,"ConstrutorTab2StartHourCombo",m_subwin,20,99,142,123))
      return(false);
   for(int i=0;i<24;i++)
      m_tab2_start_hour_combo.AddItem(StringFormat("%02d",i),i);
   m_tab2_start_hour_combo.Select(9);
   if(!m_tab2_page.Add(m_tab2_start_hour_combo))
      return(false);

   if(!m_tab2_start_min_label.Create(m_chart_id,"ConstrutorTab2StartMinLabel",m_subwin,164,79,0,0))
      return(false);
   m_tab2_start_min_label.Text("Min");
   m_tab2_start_min_label.FontSize(9);
   m_tab2_start_min_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_start_min_label))
      return(false);

   if(!m_tab2_start_min_combo.Create(m_chart_id,"ConstrutorTab2StartMinCombo",m_subwin,164,99,316,123))
      return(false);
   for(int i=0;i<60;i++)
      m_tab2_start_min_combo.AddItem(StringFormat("%02d",i),i);
   m_tab2_start_min_combo.Select(0);
   if(!m_tab2_page.Add(m_tab2_start_min_combo))
      return(false);

   if(!m_tab2_end_label.Create(m_chart_id,"ConstrutorTab2EndLabel",m_subwin,20,135,0,0))
      return(false);
   m_tab2_end_label.Text("Fim das operacoes");
   m_tab2_end_label.FontSize(10);
   m_tab2_end_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_end_label))
      return(false);

   if(!m_tab2_end_hour_label.Create(m_chart_id,"ConstrutorTab2EndHourLabel",m_subwin,20,157,0,0))
      return(false);
   m_tab2_end_hour_label.Text("Hora");
   m_tab2_end_hour_label.FontSize(9);
   m_tab2_end_hour_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_end_hour_label))
      return(false);

   if(!m_tab2_end_hour_combo.Create(m_chart_id,"ConstrutorTab2EndHourCombo",m_subwin,20,177,142,201))
      return(false);
   for(int i=0;i<24;i++)
      m_tab2_end_hour_combo.AddItem(StringFormat("%02d",i),i);
   m_tab2_end_hour_combo.Select(17);
   if(!m_tab2_page.Add(m_tab2_end_hour_combo))
      return(false);

   if(!m_tab2_end_min_label.Create(m_chart_id,"ConstrutorTab2EndMinLabel",m_subwin,164,157,0,0))
      return(false);
   m_tab2_end_min_label.Text("Min");
   m_tab2_end_min_label.FontSize(9);
   m_tab2_end_min_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_end_min_label))
      return(false);

   if(!m_tab2_end_min_combo.Create(m_chart_id,"ConstrutorTab2EndMinCombo",m_subwin,164,177,316,201))
      return(false);
   for(int i=0;i<60;i++)
      m_tab2_end_min_combo.AddItem(StringFormat("%02d",i),i);
   m_tab2_end_min_combo.Select(0);
   if(!m_tab2_page.Add(m_tab2_end_min_combo))
      return(false);

   if(!m_tab2_zero_label.Create(m_chart_id,"ConstrutorTab2ZeroLabel",m_subwin,396,57,0,0))
      return(false);
   m_tab2_zero_label.Text("Zerar posicoes");
   m_tab2_zero_label.FontSize(10);
   m_tab2_zero_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_zero_label))
      return(false);

   if(!m_tab2_zero_combo.Create(m_chart_id,"ConstrutorTab2ZeroCombo",m_subwin,396,79,700,103))
      return(false);
   m_tab2_zero_combo.AddItem("Nao",0);
   m_tab2_zero_combo.AddItem("Sim",1);
   m_tab2_zero_combo.Select(0);
   if(!m_tab2_page.Add(m_tab2_zero_combo))
      return(false);

   if(!m_tab2_zero_time_label.Create(m_chart_id,"ConstrutorTab2ZeroTimeLabel",m_subwin,396,119,0,0))
      return(false);
   m_tab2_zero_time_label.Text("Horario de zeragem");
   m_tab2_zero_time_label.FontSize(10);
   m_tab2_zero_time_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_zero_time_label))
      return(false);

   if(!m_tab2_zero_time_edit.Create(m_chart_id,"ConstrutorTab2ZeroTimeEdit",m_subwin,396,141,700,165))
      return(false);
   m_tab2_zero_time_edit.Text("17:30");
   m_tab2_zero_time_edit.FontSize(10);
   if(!m_tab2_page.Add(m_tab2_zero_time_edit))
      return(false);

   SetTab2Visible(false);
   return(true);
  }

bool CConstrutorDialog::CreateTab3(void)
  {
   if(!m_tab3_page.Create(m_chart_id,"ConstrutorTab3Page",m_subwin,256,145,992,544))
      return(false);
   if(!Add(m_tab3_page))
      return(false);

   if(!m_tab3_card.Create(m_chart_id,"ConstrutorTab3Card",m_subwin,0,0,716,399))
      return(false);
   m_tab3_card.ColorBackground(C'233,220,203');
   m_tab3_card.ColorBorder(C'197,168,136');
   m_tab3_card.BorderType(BORDER_FLAT);
   if(!m_tab3_page.Add(m_tab3_card))
      return(false);

   if(!m_tab3_card_title.Create(m_chart_id,"ConstrutorTab3CardTitle",m_subwin,20,17,0,0))
      return(false);
   m_tab3_card_title.Text("Configuracao inicial");
   m_tab3_card_title.FontSize(12);
   m_tab3_card_title.Color(C'43,43,43');
   if(!m_tab3_page.Add(m_tab3_card_title))
      return(false);

   if(!m_tab3_tempo_label.Create(m_chart_id,"ConstrutorTab3TempoLabel",m_subwin,20,57,0,0))
      return(false);
   m_tab3_tempo_label.Text("Tempo grafico");
   m_tab3_tempo_label.FontSize(10);
   m_tab3_tempo_label.Color(C'91,78,64');
   if(!m_tab3_page.Add(m_tab3_tempo_label))
      return(false);

   if(!m_tab3_tempo_combo.Create(m_chart_id,"ConstrutorTab3TempoCombo",m_subwin,20,79,316,103))
      return(false);
   m_tab3_tempo_combo.AddItem("Corrente",CONSTRUTOR_CORRENTE);
   m_tab3_tempo_combo.AddItem("M1",CONSTRUTOR_M1);
   m_tab3_tempo_combo.AddItem("M2",CONSTRUTOR_M2);
   m_tab3_tempo_combo.AddItem("M3",CONSTRUTOR_M3);
   m_tab3_tempo_combo.AddItem("M4",CONSTRUTOR_M4);
   m_tab3_tempo_combo.AddItem("M5",CONSTRUTOR_M5);
   m_tab3_tempo_combo.AddItem("M6",CONSTRUTOR_M6);
   m_tab3_tempo_combo.AddItem("M10",CONSTRUTOR_M10);
   m_tab3_tempo_combo.AddItem("M12",CONSTRUTOR_M12);
   m_tab3_tempo_combo.AddItem("M15",CONSTRUTOR_M15);
   m_tab3_tempo_combo.AddItem("M30",CONSTRUTOR_M30);
   m_tab3_tempo_combo.AddItem("H1",CONSTRUTOR_H1);
   m_tab3_tempo_combo.AddItem("H2",CONSTRUTOR_H2);
   m_tab3_tempo_combo.AddItem("H3",CONSTRUTOR_H3);
   m_tab3_tempo_combo.AddItem("H4",CONSTRUTOR_H4);
   m_tab3_tempo_combo.AddItem("H6",CONSTRUTOR_H6);
   m_tab3_tempo_combo.AddItem("H8",CONSTRUTOR_H8);
   m_tab3_tempo_combo.AddItem("H12",CONSTRUTOR_H12);
   m_tab3_tempo_combo.AddItem("D1",CONSTRUTOR_D1);
   m_tab3_tempo_combo.AddItem("W1",CONSTRUTOR_W1);
   m_tab3_tempo_combo.AddItem("MN1",CONSTRUTOR_MN1);
   m_tab3_tempo_combo.SelectByValue(CONSTRUTOR_CORRENTE);
   if(!m_tab3_page.Add(m_tab3_tempo_combo))
      return(false);

   if(!m_tab3_volume_label.Create(m_chart_id,"ConstrutorTab3VolumeLabel",m_subwin,20,119,0,0))
      return(false);
   m_tab3_volume_label.Text("Volume inicial");
   m_tab3_volume_label.FontSize(10);
   m_tab3_volume_label.Color(C'91,78,64');
   if(!m_tab3_page.Add(m_tab3_volume_label))
      return(false);

   if(!m_tab3_volume_edit.Create(m_chart_id,"ConstrutorTab3VolumeEdit",m_subwin,20,141,316,165))
      return(false);
   m_tab3_volume_edit.Text("1");
   m_tab3_volume_edit.FontSize(10);
   if(!m_tab3_page.Add(m_tab3_volume_edit))
      return(false);

   if(!m_tab3_spread_label.Create(m_chart_id,"ConstrutorTab3SpreadLabel",m_subwin,20,185,0,0))
      return(false);
   m_tab3_spread_label.Text("Spread maximo");
   m_tab3_spread_label.FontSize(10);
   m_tab3_spread_label.Color(C'91,78,64');
   if(!m_tab3_page.Add(m_tab3_spread_label))
      return(false);

   if(!m_tab3_spread_edit.Create(m_chart_id,"ConstrutorTab3SpreadEdit",m_subwin,20,207,316,231))
      return(false);
   m_tab3_spread_edit.Text("10");
   m_tab3_spread_edit.FontSize(10);
   if(!m_tab3_page.Add(m_tab3_spread_edit))
      return(false);

   SetTab3Visible(false);
   return(true);
  }

bool CConstrutorDialog::CreateTab4(void)
  {
   if(!m_tab4_page.Create(m_chart_id,"ConstrutorTab4Page",m_subwin,256,145,992,544))
      return(false);
   if(!Add(m_tab4_page))
      return(false);

   if(!m_tab4_card.Create(m_chart_id,"ConstrutorTab4Card",m_subwin,0,0,716,399))
      return(false);
   m_tab4_card.ColorBackground(C'233,220,203');
   m_tab4_card.ColorBorder(C'197,168,136');
   m_tab4_card.BorderType(BORDER_FLAT);
   if(!m_tab4_page.Add(m_tab4_card))
      return(false);

   if(!m_tab4_card_title.Create(m_chart_id,"ConstrutorTab4CardTitle",m_subwin,20,17,0,0))
      return(false);
   m_tab4_card_title.Text("Regras de stop loss");
   m_tab4_card_title.FontSize(12);
   m_tab4_card_title.Color(C'43,43,43');
   if(!m_tab4_page.Add(m_tab4_card_title))
      return(false);

   if(!m_tab4_use_label.Create(m_chart_id,"ConstrutorTab4UseLabel",m_subwin,20,46,0,0))
      return(false);
   m_tab4_use_label.Text("Usar stop loss");
   m_tab4_use_label.FontSize(10);
   m_tab4_use_label.Color(C'91,78,64');
   if(!m_tab4_page.Add(m_tab4_use_label))
      return(false);

   if(!m_tab4_use_combo.Create(m_chart_id,"ConstrutorTab4UseCombo",m_subwin,20,68,316,92))
      return(false);
   m_tab4_use_combo.AddItem("Nao",CONSTRUTOR_NAO);
   m_tab4_use_combo.AddItem("Sim",CONSTRUTOR_SIM);
   m_tab4_use_combo.SelectByValue(CONSTRUTOR_NAO);
   if(!m_tab4_page.Add(m_tab4_use_combo))
      return(false);

   if(!m_tab4_type_label.Create(m_chart_id,"ConstrutorTab4TypeLabel",m_subwin,396,46,0,0))
      return(false);
   m_tab4_type_label.Text("Tipo de stop");
   m_tab4_type_label.FontSize(10);
   m_tab4_type_label.Color(C'91,78,64');
   if(!m_tab4_page.Add(m_tab4_type_label))
      return(false);

   if(!m_tab4_type_combo.Create(m_chart_id,"ConstrutorTab4TypeCombo",m_subwin,396,68,700,92))
      return(false);
   m_tab4_type_combo.AddItem("Pontos",CONSTRUTOR_STOP_PONTOS);
   m_tab4_type_combo.AddItem("Percentual",CONSTRUTOR_STOP_PERCENTUAL);
   m_tab4_type_combo.SelectByValue(CONSTRUTOR_STOP_PONTOS);
   if(!m_tab4_page.Add(m_tab4_type_combo))
      return(false);

   if(!m_tab4_card_fixed.Create(m_chart_id,"ConstrutorTab4CardFixed",m_subwin,8,108,184,391))
      return(false);
   m_tab4_card_fixed.ColorBackground(C'233,220,203');
   m_tab4_card_fixed.ColorBorder(C'197,168,136');
   m_tab4_card_fixed.BorderType(BORDER_FLAT);
   if(!m_tab4_page.Add(m_tab4_card_fixed))
      return(false);

   if(!m_tab4_card_fixed_title.Create(m_chart_id,"ConstrutorTab4CardFixedTitle",m_subwin,44,120,0,0))
      return(false);
   m_tab4_card_fixed_title.Text("Fixo");
   m_tab4_card_fixed_title.FontSize(12);
   m_tab4_card_fixed_title.Color(C'43,43,43');
   if(!m_tab4_page.Add(m_tab4_card_fixed_title))
      return(false);

   if(!m_tab4_card_fixed_check.Create(m_chart_id,"ConstrutorTab4CardFixedCheck",m_subwin,20,120,176,148))
      return(false);
   m_tab4_card_fixed_check.Text("Usar stop loss fixo");
   m_tab4_card_fixed_check.Color(C'91,78,64');
   m_tab4_card_fixed_check.ColorBackground(C'233,220,203');
   m_tab4_card_fixed_check.Checked(false);
   if(!m_tab4_page.Add(m_tab4_card_fixed_check))
      return(false);

   if(!m_tab4_card_fixed_dist_label.Create(m_chart_id,"ConstrutorTab4CardFixedDistLabel",m_subwin,20,188,0,0))
      return(false);
   m_tab4_card_fixed_dist_label.Text("Distancia");
   m_tab4_card_fixed_dist_label.FontSize(10);
   m_tab4_card_fixed_dist_label.Color(C'91,78,64');
   if(!m_tab4_page.Add(m_tab4_card_fixed_dist_label))
      return(false);

   if(!m_tab4_card_fixed_dist_edit.Create(m_chart_id,"ConstrutorTab4CardFixedDistEdit",m_subwin,20,210,168,234))
      return(false);
   m_tab4_card_fixed_dist_edit.Text("100");
   m_tab4_card_fixed_dist_edit.FontSize(10);
   if(!m_tab4_page.Add(m_tab4_card_fixed_dist_edit))
      return(false);

   if(!m_tab4_card_calc.Create(m_chart_id,"ConstrutorTab4CardCalc",m_subwin,196,108,708,391))
      return(false);
   m_tab4_card_calc.ColorBackground(C'233,220,203');
   m_tab4_card_calc.ColorBorder(C'197,168,136');
   m_tab4_card_calc.BorderType(BORDER_FLAT);
   m_tab4_card_calc.ZOrder(0);
   if(!m_tab4_page.Add(m_tab4_card_calc))
      return(false);

   if(!m_tab4_card_calc_inner_left.Create(m_chart_id,"ConstrutorTab4CardCalcInnerLeft",m_subwin,212,191,324,370))
      return(false);
   m_tab4_card_calc_inner_left.ColorBackground(clrNONE);
   m_tab4_card_calc_inner_left.ColorBorder(C'197,168,136');
   m_tab4_card_calc_inner_left.BorderType(BORDER_FLAT);
   m_tab4_card_calc_inner_left.ZOrder(19);

   if(!m_tab4_card_calc_inner.Create(m_chart_id,"ConstrutorTab4CardCalcInner",m_subwin,325,191,444,370))
      return(false);
   m_tab4_card_calc_inner.ColorBackground(clrNONE);
   m_tab4_card_calc_inner.ColorBorder(C'197,168,136');
   m_tab4_card_calc_inner.BorderType(BORDER_FLAT);
   m_tab4_card_calc_inner.ZOrder(20);

   if(!m_tab4_card_calc_mode_card.Create(m_chart_id,"ConstrutorTab4CardCalcModeCard",m_subwin,206,152,448,380))
      return(false);
   m_tab4_card_calc_mode_card.ColorBackground(C'233,220,203');
   m_tab4_card_calc_mode_card.ColorBorder(C'197,168,136');
   m_tab4_card_calc_mode_card.BorderType(BORDER_FLAT);
   m_tab4_card_calc_mode_card.ZOrder(10);
   m_tab4_card_calc_mode_card.FontSize(12);
   m_tab4_card_calc_mode_card.Color(C'43,43,43');
   if(!m_tab4_page.Add(m_tab4_card_calc_mode_card))
      return(false);

   if(!m_tab4_card_calc_check.Create(m_chart_id,"ConstrutorTab4CardCalcCheck",m_subwin,206,120,362,148))
      return(false);
   m_tab4_card_calc_check.Text("Usar Calculo");
   m_tab4_card_calc_check.Color(C'91,78,64');
   m_tab4_card_calc_check.ColorBackground(C'233,220,203');
   m_tab4_card_calc_check.Checked(false);
   if(!m_tab4_page.Add(m_tab4_card_calc_check))
      return(false);

   if(!m_tab4_card_calc_ref_card.Create(m_chart_id,"ConstrutorTab4CardCalcRefCard",m_subwin,458,152,698,380))
      return(false);
   m_tab4_card_calc_ref_card.ColorBackground(C'233,220,203');
   m_tab4_card_calc_ref_card.ColorBorder(C'197,168,136');
   m_tab4_card_calc_ref_card.BorderType(BORDER_FLAT);
   m_tab4_card_calc_ref_card.ZOrder(11);
   m_tab4_card_calc_ref_card.FontSize(12);
   m_tab4_card_calc_ref_card.Color(C'43,43,43');
   if(!m_tab4_page.Add(m_tab4_card_calc_ref_card))
      return(false);

   if(!m_tab4_card_calc_mode_outer_check.Create(m_chart_id,"ConstrutorTab4CardCalcModeOuterCheck",m_subwin,216,170,386,190))
      return(false);
   m_tab4_card_calc_mode_outer_check.Text("Calculo");
   m_tab4_card_calc_mode_outer_check.Color(C'91,78,64');
   m_tab4_card_calc_mode_outer_check.ColorBackground(C'233,220,203');
   m_tab4_card_calc_mode_outer_check.Checked(false);
   if(!m_tab4_page.Add(m_tab4_card_calc_mode_outer_check))
      return(false);

   if(!m_tab4_card_calc_ref_outer_check.Create(m_chart_id,"ConstrutorTab4CardCalcRefOuterCheck",m_subwin,468,170,688,190))
      return(false);
   m_tab4_card_calc_ref_outer_check.Text("Referencia do preco");
   m_tab4_card_calc_ref_outer_check.Color(C'91,78,64');
   m_tab4_card_calc_ref_outer_check.ColorBackground(C'233,220,203');
   m_tab4_card_calc_ref_outer_check.Checked(false);
   if(!m_tab4_page.Add(m_tab4_card_calc_ref_outer_check))
      return(false);

   if(!m_tab4_page.Add(m_tab4_card_calc_inner_left))
      return(false);

   if(!m_tab4_card_calc_mode_check.Create(m_chart_id,"ConstrutorTab4CardCalcModeCheck",m_subwin,223,204,308,224))
      return(false);
   m_tab4_card_calc_mode_check.Text("Media");
   m_tab4_card_calc_mode_check.Color(C'91,78,64');
   m_tab4_card_calc_mode_check.ColorBackground(C'233,220,203');
   m_tab4_card_calc_mode_check.Checked(false);
   if(!m_tab4_page.Add(m_tab4_card_calc_mode_check))
      return(false);

   if(!m_tab4_card_calc_mode_qty_label.Create(m_chart_id,"ConstrutorTab4CardCalcModeQtyLabel",m_subwin,223,232,318,248))
      return(false);
   m_tab4_card_calc_mode_qty_label.Text("Qtd candles");
   m_tab4_card_calc_mode_qty_label.Color(C'91,78,64');
   if(!m_tab4_page.Add(m_tab4_card_calc_mode_qty_label))
      return(false);

   if(!m_tab4_card_calc_mode_qty_spin.Create(m_chart_id,"ConstrutorTab4CardCalcModeQtySpin",m_subwin,223,250,311,270))
      return(false);
   m_tab4_card_calc_mode_qty_spin.MinValue(1);
   m_tab4_card_calc_mode_qty_spin.MaxValue(999);
   m_tab4_card_calc_mode_qty_spin.Value(3);
   if(!m_tab4_page.Add(m_tab4_card_calc_mode_qty_spin))
      return(false);

   if(!m_tab4_card_calc_mode_base_label.Create(m_chart_id,"ConstrutorTab4CardCalcModeBaseLabel",m_subwin,223,278,311,294))
      return(false);
   m_tab4_card_calc_mode_base_label.Text("Base");
   m_tab4_card_calc_mode_base_label.Color(C'91,78,64');
   if(!m_tab4_page.Add(m_tab4_card_calc_mode_base_label))
      return(false);

   if(!m_tab4_card_calc_mode_base_combo.Create(m_chart_id,"ConstrutorTab4CardCalcModeBaseCombo",m_subwin,223,296,311,320))
      return(false);
   m_tab4_card_calc_mode_base_combo.AddItem("Maxima",CONSTRUTOR_MEDIA_MAXIMA);
   m_tab4_card_calc_mode_base_combo.AddItem("Minima",CONSTRUTOR_MEDIA_MINIMA);
   m_tab4_card_calc_mode_base_combo.AddItem("Abertura",CONSTRUTOR_MEDIA_ABERTURA);
   m_tab4_card_calc_mode_base_combo.AddItem("Fechamento",CONSTRUTOR_MEDIA_FECHAMENTO);
   m_tab4_card_calc_mode_base_combo.SelectByValue(CONSTRUTOR_MEDIA_MAXIMA);
   if(!m_tab4_page.Add(m_tab4_card_calc_mode_base_combo))
      return(false);

   if(!m_tab4_page.Add(m_tab4_card_calc_inner))
      return(false);

   if(!m_tab4_card_calc_ref_check.Create(m_chart_id,"ConstrutorTab4CardCalcRefCheck",m_subwin,336,204,435,224))
      return(false);
   m_tab4_card_calc_ref_check.Text("Multiplicar");
   m_tab4_card_calc_ref_check.Color(C'91,78,64');
   m_tab4_card_calc_ref_check.ColorBackground(C'233,220,203');
   m_tab4_card_calc_ref_check.Checked(false);
   if(!m_tab4_page.Add(m_tab4_card_calc_ref_check))
      return(false);

   SetTab4Visible(false);
   return(true);
  }

bool CConstrutorDialog::CreateExecuteButton(void)
  {
   if(!m_execute_button.Create(m_chart_id,"ConstrutorExecuteButton",m_subwin,816,610,964,636))
      return(false);
   m_execute_button.Text("Executar");
   m_execute_button.FontSize(11);
   m_execute_button.Color(clrWhite);
   m_execute_button.ColorBackground(C'226,114,64');
   m_execute_button.ColorBorder(C'240,140,86');
   m_execute_button.Locking(false);
   if(!Add(m_execute_button))
      return(false);
   return(true);
  }

void CConstrutorDialog::SetTab1Visible(const bool visible)
  {
   if(visible)
      m_tab1_page.Show();
   else
      m_tab1_page.Hide();
  }

void CConstrutorDialog::SetTab2Visible(const bool visible)
  {
   if(visible)
      m_tab2_page.Show();
   else
      m_tab2_page.Hide();
  }

void CConstrutorDialog::SetTab3Visible(const bool visible)
  {
   if(visible)
      m_tab3_page.Show();
   else
      m_tab3_page.Hide();
  }

void CConstrutorDialog::SetTab4Visible(const bool visible)
  {
   if(visible)
      m_tab4_page.Show();
   else
      m_tab4_page.Hide();
  }

void CConstrutorDialog::SyncTab4Visibility(void)
  {
   const bool tab4_visible=(m_active_tab==3);
   SetTab4Visible(tab4_visible);
  }

void CConstrutorDialog::SelectTab(const int index)
  {
   if(index<0 || index>=TAB_COUNT)
      return;

   m_active_tab=index;
   m_page_title.Text(m_tab_titles[m_active_tab]);
   m_page_note.Text(m_tab_notes[m_active_tab]);
   SetTab1Visible(index==0);
   SetTab2Visible(index==1);
   SetTab3Visible(index==2);
   SetTab4Visible(index==3);
   UpdateTabVisuals();
   ChartRedraw();
  }

void CConstrutorDialog::LoadSettingsToControls(void)
  {
   if(!m_settings_bound)
      return;

   m_tab1_name_edit.Text(m_settings.estrategia_nome);
   m_tab1_market_combo.SelectByValue((long)m_settings.mercado);
   m_tab1_oper_combo.SelectByValue((long)m_settings.tipo_operacional);
   m_tab1_mode_combo.SelectByValue((long)m_settings.modo_processamento);
   m_tab1_buy_combo.SelectByValue((long)m_settings.operar_compra);
   m_tab1_sell_combo.SelectByValue((long)m_settings.operar_venda);

   m_tab2_start_hour_combo.SelectByValue((long)m_settings.inicio_hora);
   m_tab2_start_min_combo.SelectByValue((long)m_settings.inicio_minuto);
   m_tab2_end_hour_combo.SelectByValue((long)m_settings.fim_hora);
   m_tab2_end_min_combo.SelectByValue((long)m_settings.fim_minuto);
   m_tab2_zero_combo.SelectByValue((long)m_settings.zerar_posicoes);
   m_tab2_zero_time_edit.Text(m_settings.horario_zeragem);
   m_tab3_tempo_combo.SelectByValue((long)m_settings.tempo_grafico);
   m_tab3_volume_edit.Text(DoubleToString(m_settings.volume_inicial,2));
   m_tab3_spread_edit.Text((string)m_settings.spread_maximo);
   m_tab4_use_combo.SelectByValue((long)m_settings.usar_stop_loss);
   m_tab4_type_combo.SelectByValue((long)m_settings.tipo_stop_loss);
   m_tab4_card_calc_mode_qty_spin.Value(m_settings.stop_calculo_media_qtd_candles);
   m_tab4_card_calc_mode_base_combo.SelectByValue((long)m_settings.stop_calculo_media_base);
    m_tab4_updating_checks=true;
     if(m_settings.stop_fixo==CONSTRUTOR_SIM)
       {
        m_tab4_card_fixed_check.Checked(true);
        m_tab4_card_calc_check.Checked(false);
        m_tab4_card_calc_mode_outer_check.Checked(false);
        m_tab4_card_calc_ref_outer_check.Checked(false);
        m_tab4_card_calc_mode_check.Checked(false);
        m_tab4_card_calc_ref_check.Checked(false);
       }
     else if(m_settings.stop_calculo_media==CONSTRUTOR_SIM)
       {
        m_tab4_card_fixed_check.Checked(false);
        m_tab4_card_calc_check.Checked(true);
        m_tab4_card_calc_mode_outer_check.Checked(true);
        m_tab4_card_calc_ref_outer_check.Checked(false);
        m_tab4_card_calc_mode_check.Checked(true);
        m_tab4_card_calc_ref_check.Checked(false);
       }
     else if(m_settings.stop_calculo_multiplicar==CONSTRUTOR_SIM)
       {
        m_tab4_card_fixed_check.Checked(false);
        m_tab4_card_calc_check.Checked(true);
        m_tab4_card_calc_mode_outer_check.Checked(false);
        m_tab4_card_calc_ref_outer_check.Checked(true);
        m_tab4_card_calc_mode_check.Checked(false);
        m_tab4_card_calc_ref_check.Checked(true);
       }
     else if(m_settings.stop_calculo==CONSTRUTOR_SIM)
       {
        m_tab4_card_fixed_check.Checked(false);
        m_tab4_card_calc_check.Checked(true);
        m_tab4_card_calc_mode_outer_check.Checked(true);
        m_tab4_card_calc_ref_outer_check.Checked(false);
        m_tab4_card_calc_mode_check.Checked(true);
        m_tab4_card_calc_ref_check.Checked(false);
       }
     else
       {
        m_tab4_card_fixed_check.Checked(false);
        m_tab4_card_calc_check.Checked(false);
        m_tab4_card_calc_mode_outer_check.Checked(false);
        m_tab4_card_calc_ref_outer_check.Checked(false);
        m_tab4_card_calc_mode_check.Checked(false);
        m_tab4_card_calc_ref_check.Checked(false);
       }
    m_tab4_updating_checks=false;
    m_tab4_card_fixed_dist_edit.Text(DoubleToString(m_settings.stop_fixo_distancia,2));
   }

void CConstrutorDialog::StoreControlsToSettings(void)
  {
   if(!m_settings_bound)
      return;

   m_settings.estrategia_nome    =m_tab1_name_edit.Text();
   m_settings.mercado            =(ENUM_CONSTRUTOR_MERCADO)m_tab1_market_combo.Value();
   m_settings.tipo_operacional   =(ENUM_CONSTRUTOR_TIPO_OPERACIONAL)m_tab1_oper_combo.Value();
   m_settings.modo_processamento =(ENUM_CONSTRUTOR_MODO_PROCESSAMENTO)m_tab1_mode_combo.Value();
   m_settings.operar_compra      =(ENUM_CONSTRUTOR_SIM_NAO)m_tab1_buy_combo.Value();
   m_settings.operar_venda       =(ENUM_CONSTRUTOR_SIM_NAO)m_tab1_sell_combo.Value();
   m_settings.inicio_hora        =(int)m_tab2_start_hour_combo.Value();
   m_settings.inicio_minuto      =(int)m_tab2_start_min_combo.Value();
   m_settings.fim_hora           =(int)m_tab2_end_hour_combo.Value();
   m_settings.fim_minuto         =(int)m_tab2_end_min_combo.Value();
   m_settings.zerar_posicoes     =(ENUM_CONSTRUTOR_SIM_NAO)m_tab2_zero_combo.Value();
   m_settings.horario_zeragem    =m_tab2_zero_time_edit.Text();
   m_settings.tempo_grafico      =(ENUM_CONSTRUTOR_TEMPO_GRAFICO)m_tab3_tempo_combo.Value();
   m_settings.volume_inicial     =StringToDouble(m_tab3_volume_edit.Text());
   m_settings.spread_maximo      =(int)StringToInteger(m_tab3_spread_edit.Text());
   m_settings.usar_stop_loss     =(ENUM_CONSTRUTOR_SIM_NAO)m_tab4_use_combo.Value();
   m_settings.tipo_stop_loss     =(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)m_tab4_type_combo.Value();
    m_settings.stop_fixo          =m_tab4_card_fixed_check.Checked() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO;
   m_settings.stop_calculo       =((m_tab4_card_calc_check.Checked() || m_tab4_card_calc_mode_check.Checked() || m_tab4_card_calc_ref_check.Checked()) ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
   m_settings.stop_calculo_media =m_tab4_card_calc_mode_check.Checked() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO;
   m_settings.stop_calculo_multiplicar=m_tab4_card_calc_ref_check.Checked() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO;
   m_settings.stop_calculo_media_qtd_candles=m_tab4_card_calc_mode_qty_spin.Value();
   m_settings.stop_calculo_media_base =(ENUM_CONSTRUTOR_BASE_MEDIA)m_tab4_card_calc_mode_base_combo.Value();
   m_settings.stop_fixo_distancia=StringToDouble(m_tab4_card_fixed_dist_edit.Text());
  }

void CConstrutorDialog::UpdateTabVisuals(void)
  {
   for(int i=0; i<TAB_COUNT; i++)
     {
      const bool selected=(i==m_active_tab);
      m_tabs[i].Pressed(selected);
      m_tabs[i].Color(clrWhite);
      m_tabs[i].ColorBackground(selected ? C'226,114,64' : C'39,54,78');
      m_tabs[i].ColorBorder(selected ? C'240,140,86' : C'62,79,101');
     }
  }

bool CConstrutorDialog::OnTabClick(const int index)
  {
   SelectTab(index);
   return(true);
  }

bool CConstrutorDialog::OnExecuteClick(void)
  {
   StoreControlsToSettings();
   if(m_settings_bound)
     {
      g_settings=m_settings;
      Print("Construtor: configuracao aplicada pelo painel");
     }
   return(true);
  }

bool CConstrutorDialog::OnTab4FixedChange(void)
  {
   if(m_tab4_updating_checks)
      return(true);

   if(m_tab4_card_fixed_check.Checked())
     {
      m_tab4_updating_checks=true;
      m_tab4_card_calc_check.Checked(false);
      m_tab4_card_calc_mode_check.Checked(false);
      m_tab4_card_calc_ref_check.Checked(false);
      m_tab4_updating_checks=false;
     }
   return(true);
  }

bool CConstrutorDialog::OnTab4CalcChange(void)
  {
   if(m_tab4_updating_checks)
      return(true);

   if(m_tab4_card_calc_check.Checked())
     {
      m_tab4_updating_checks=true;
      m_tab4_card_fixed_check.Checked(false);
      if(!m_tab4_card_calc_mode_check.Checked() && !m_tab4_card_calc_ref_check.Checked())
        {
         m_tab4_card_calc_mode_check.Checked(true);
         m_tab4_card_calc_mode_outer_check.Checked(true);
        }
      m_tab4_updating_checks=false;
     }
    else
      {
       m_tab4_updating_checks=true;
       m_tab4_card_calc_mode_outer_check.Checked(false);
       m_tab4_card_calc_ref_outer_check.Checked(false);
       m_tab4_card_calc_mode_check.Checked(false);
       m_tab4_card_calc_ref_check.Checked(false);
       m_tab4_updating_checks=false;
      }
    return(true);
   }

bool CConstrutorDialog::OnTab4CalcModeOuterChange(void)
  {
   if(m_tab4_updating_checks)
      return(true);

   if(m_tab4_card_calc_mode_outer_check.Checked())
     {
      m_tab4_updating_checks=true;
      m_tab4_card_fixed_check.Checked(false);
      m_tab4_card_calc_check.Checked(true);
      m_tab4_card_calc_ref_outer_check.Checked(false);
      m_tab4_updating_checks=false;
     }
   return(true);
  }

bool CConstrutorDialog::OnTab4CalcRefOuterChange(void)
  {
   if(m_tab4_updating_checks)
      return(true);

   if(m_tab4_card_calc_ref_outer_check.Checked())
     {
      m_tab4_updating_checks=true;
      m_tab4_card_fixed_check.Checked(false);
      m_tab4_card_calc_check.Checked(true);
      m_tab4_card_calc_mode_outer_check.Checked(false);
      m_tab4_updating_checks=false;
     }
   return(true);
  }

bool CConstrutorDialog::OnTab4CalcModeChange(void)
  {
   if(m_tab4_updating_checks)
      return(true);

   m_tab4_updating_checks=true;
   if(m_tab4_card_calc_mode_check.Checked())
     {
      m_tab4_card_fixed_check.Checked(false);
      m_tab4_card_calc_check.Checked(true);
      m_tab4_card_calc_ref_check.Checked(false);
     }
   m_tab4_updating_checks=false;
   return(true);
  }

bool CConstrutorDialog::OnTab4CalcRefChange(void)
  {
   if(m_tab4_updating_checks)
      return(true);

   m_tab4_updating_checks=true;
   if(m_tab4_card_calc_ref_check.Checked())
     {
      m_tab4_card_fixed_check.Checked(false);
      m_tab4_card_calc_mode_check.Checked(false);
      m_tab4_card_calc_check.Checked(true);
     }
   m_tab4_updating_checks=false;
   return(true);
  }

#endif // __CONSTRUTOR_DIALOG_MQH__
