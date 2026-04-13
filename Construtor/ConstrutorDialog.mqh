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
      m_tabs[i].Locking(true);
      if(!Add(m_tabs[i]))
         return(false);
     }
   return(true);
  }

void CConstrutorDialog::SelectTab(const int index)
  {
   if(index<0 || index>=TAB_COUNT)
      return;

   m_active_tab=index;
   m_page_title.Text(m_tab_titles[m_active_tab]);
   m_page_note.Text(m_tab_notes[m_active_tab]);
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
