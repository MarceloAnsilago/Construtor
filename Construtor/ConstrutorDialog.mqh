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
   CWndContainer     m_tab1_page;
   CWndContainer     m_tab2_page;
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
   int               m_active_tab;
   string            m_tab_titles[TAB_COUNT];
   string            m_tab_notes[TAB_COUNT];

public:
                     CConstrutorDialog(void);
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   virtual void      Destroy(const int reason=REASON_PROGRAM);
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

private:
   void              InitTabData(void);
   bool              CreateLayout(void);
   bool              CreateSidebar(void);
   bool              CreateContent(void);
   bool              CreateTabs(void);
   bool              CreateTab1(void);
   bool              CreateTab2(void);
   void              SetTab1Visible(const bool visible);
   void              SetTab2Visible(const bool visible);
   void              SelectTab(const int index);
   void              UpdateTabVisuals(void);
   bool              OnTabClick(const int index);
  };

EVENT_MAP_BEGIN(CConstrutorDialog)
   ON_INDEXED_EVENT(ON_CLICK,m_tabs,OnTabClick)
EVENT_MAP_END(CAppDialog)

CConstrutorDialog::CConstrutorDialog(void) : m_active_tab(0)
  {
   InitTabData();
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
   m_tab_notes[2]="Ajustes iniciais de execucao e processamento.";
   m_tab_notes[3]="Parametros de protecao por perda.";
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
   m_tab1_card_left.ColorBackground(C'247,241,231');
   m_tab1_card_left.ColorBorder(C'220,207,186');
   m_tab1_card_left.BorderType(BORDER_FLAT);
   if(!m_tab1_page.Add(m_tab1_card_left))
      return(false);

   if(!m_tab1_card_right.Create(m_chart_id,"ConstrutorTab1CardRight",m_subwin,376,0,724,399))
      return(false);
   m_tab1_card_right.ColorBackground(C'247,241,231');
   m_tab1_card_right.ColorBorder(C'220,207,186');
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
   m_tab2_card_left.ColorBackground(C'247,241,231');
   m_tab2_card_left.ColorBorder(C'220,207,186');
   m_tab2_card_left.BorderType(BORDER_FLAT);
   if(!m_tab2_page.Add(m_tab2_card_left))
      return(false);

   if(!m_tab2_card_right.Create(m_chart_id,"ConstrutorTab2CardRight",m_subwin,376,0,724,399))
      return(false);
   m_tab2_card_right.ColorBackground(C'247,241,231');
   m_tab2_card_right.ColorBorder(C'220,207,186');
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

   if(!m_tab2_end_label.Create(m_chart_id,"ConstrutorTab2EndLabel",m_subwin,20,119,0,0))
      return(false);
   m_tab2_end_label.Text("Fim das operacoes");
   m_tab2_end_label.FontSize(10);
   m_tab2_end_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_end_label))
      return(false);

   if(!m_tab2_end_hour_label.Create(m_chart_id,"ConstrutorTab2EndHourLabel",m_subwin,20,141,0,0))
      return(false);
   m_tab2_end_hour_label.Text("Hora");
   m_tab2_end_hour_label.FontSize(9);
   m_tab2_end_hour_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_end_hour_label))
      return(false);

   if(!m_tab2_end_hour_combo.Create(m_chart_id,"ConstrutorTab2EndHourCombo",m_subwin,20,161,142,185))
      return(false);
   for(int i=0;i<24;i++)
      m_tab2_end_hour_combo.AddItem(StringFormat("%02d",i),i);
   m_tab2_end_hour_combo.Select(17);
   if(!m_tab2_page.Add(m_tab2_end_hour_combo))
      return(false);

   if(!m_tab2_end_min_label.Create(m_chart_id,"ConstrutorTab2EndMinLabel",m_subwin,164,141,0,0))
      return(false);
   m_tab2_end_min_label.Text("Min");
   m_tab2_end_min_label.FontSize(9);
   m_tab2_end_min_label.Color(C'91,78,64');
   if(!m_tab2_page.Add(m_tab2_end_min_label))
      return(false);

   if(!m_tab2_end_min_combo.Create(m_chart_id,"ConstrutorTab2EndMinCombo",m_subwin,164,161,316,185))
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

void CConstrutorDialog::SelectTab(const int index)
  {
   if(index<0 || index>=TAB_COUNT)
      return;

   m_active_tab=index;
   m_page_title.Text(m_tab_titles[m_active_tab]);
   m_page_note.Text(m_tab_notes[m_active_tab]);
   SetTab1Visible(index==0);
   SetTab2Visible(index==1);
   UpdateTabVisuals();
   ChartRedraw();
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

#endif // __CONSTRUTOR_DIALOG_MQH__
