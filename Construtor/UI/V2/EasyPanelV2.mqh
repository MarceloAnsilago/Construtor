#ifndef __CONSTRUTOR_EASY_PANEL_V2_MQH__
#define __CONSTRUTOR_EASY_PANEL_V2_MQH__

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

#include "..\\..\\Settings.mqh"
#include "..\\..\\..\\EasyAndFastGUI\\WndCreate.mqh"
#include "V2Shared.mqh"
#include "Tabs\\TabBase_Placeholder.mqh"
#include "Tabs\\Tab1_InfIniciais.mqh"
#include "Tabs\\Tab2_StopLoss.mqh"
#include "Tabs\\Tab3_StopMovel.mqh"
#include "Tabs\\Tab4_TakeProfit.mqh"
#include "Tabs\\Tab5_BreakEven.mqh"
#include "Tabs\\Tab6_TrailingStop.mqh"
#include "Tabs\\Tab7_SaidasParciais.mqh"
#include "Tabs\\Tab8_Sinais.mqh"
#include "Tabs\\Tab9_AjustesFinais.mqh"
#include "Tabs\\Tab10_Montagem.mqh"
#include "Tabs\\TabExecucao.mqh"
#include "Tabs\\TabPainel.mqh"

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

class CConstrutorEasyPanelV2 : public CEF_CWndCreate
  {
private:
   enum
     {
      TOP_TAB_COUNT=2,
      PARAM_TAB_COUNT=10,
      EXEC_TAB_COUNT=2
     };

   bool                 m_created;
   bool                 m_visible;
   bool                 m_has_settings;
   bool                 m_apply_requested;
   int                  m_window_index;
   int                  m_top_tab_last;
   int                  m_param_tab_last;
   int                  m_exec_tab_last;
   SConstrutorSettings  m_settings;

   CEF_CWindow          m_window;
   CEF_CTextLabel       m_title;
   CEF_CTextLabel       m_note;
   CEF_CTabs            m_top_tabs;
   CEF_CTabs            m_param_tabs;
   CEF_CTabs            m_exec_tabs;
   CEF_CButton          m_btn_apply;

   CEF_CTextLabel       m_param_header_title[PARAM_TAB_COUNT];
   CEF_CTextLabel       m_param_header_note[PARAM_TAB_COUNT];
   CEF_CTextLabel       m_exec_header_title[EXEC_TAB_COUNT];
   CEF_CTextLabel       m_exec_header_note[EXEC_TAB_COUNT];

   CTab1InfIniciaisV2   m_tab1;
   CTab2StopLoss        m_tab2;
   CTab3StopMovelV2     m_tab3;
   CTab4TakeProfitV2    m_tab4;
   CTab5BreakEvenV2     m_tab5;
   CTab6TrailingStopV2  m_tab6;
   CTab7SaidasParciaisV2 m_tab7;
   CTab8SinaisV2        m_tab8;
   CTab9AjustesFinaisV2 m_tab9;
   CTab10MontagemV2     m_tab10;
   CTabExecucaoV2       m_execucao;
   CTabPainelV2         m_painel;

   void StyleTabsButtons(CEF_CTabs &tabs,const int count,const bool vertical=false)
     {
      CEF_CButtonsGroup *group=tabs.GetButtonsGroupPointer();
      if(group==NULL)
         return;

      for(int i=0;i<count;i++)
        {
         group.GetButtonPointer(i).FontSize(vertical ? 9 : 10);
         group.GetButtonPointer(i).LabelXGap(0);
         group.GetButtonPointer(i).LabelYGap(0);
         group.GetButtonPointer(i).BackColor(C'39,54,78');
         group.GetButtonPointer(i).BackColorHover(C'62,79,101');
         group.GetButtonPointer(i).BackColorPressed(C'226,114,64');
         group.GetButtonPointer(i).BorderColor(C'18,29,43');
         group.GetButtonPointer(i).BorderColorHover(C'62,79,101');
         group.GetButtonPointer(i).BorderColorPressed(C'240,140,86');
         group.GetButtonPointer(i).LabelColor(clrWhite);
         group.GetButtonPointer(i).LabelColorHover(clrWhite);
         group.GetButtonPointer(i).LabelColorPressed(clrWhite);
        }
     }

   bool ConfigurePanelTabs(CEF_CTabs &tabs,CElement &parent,const int parent_tab,const int x,const int y,const int w,const int h,const string &labels[],const int count)
     {
      tabs.MainPointer(parent);
      tabs.XSize(w);
      tabs.YSize(h);
      tabs.IsCenterText(true);
      tabs.PositionMode(TABS_LEFT);
      tabs.TabsYSize(30);
      tabs.BackColorPressed(C'247,241,231');
      tabs.BorderColor(C'220,207,186');
      tabs.BorderColorHover(C'220,207,186');
      tabs.BorderColorPressed(C'220,207,186');

      for(int i=0;i<count;i++)
         tabs.AddTab(labels[i],240);

      if(!tabs.CreateTabs(x,y))
         return(false);

      AddToElementsArray(m_window_index,tabs);
      m_top_tabs.AddToElementsArray(parent_tab,tabs);
      StyleTabsButtons(tabs,count,true);
      return(true);
     }

   void CreateParamHeaders(void)
     {
      const int header_x=24;
      const int header_y=10;
      const int header_w=m_param_tabs.XSize()-(header_x*2);
      const int header_title_h=28;
      const int header_note_h=18;

      string titles[];
      string notes[];
      ArrayResize(titles,PARAM_TAB_COUNT);
      ArrayResize(notes,PARAM_TAB_COUNT);
      titles[0]="1. Inf. Iniciais";
      titles[1]="2. Stop loss";
      titles[2]="3. Stop movel";
      titles[3]="4. Take profit";
      titles[4]="5. Break even";
      titles[5]="6. Trailing stop";
      titles[6]="7. Saidas parciais";
      titles[7]="8. Sinais";
      titles[8]="9. Ajustes finais";
      titles[9]="10. Montagem";
      notes[0]="Base inicial do projeto e configuracao principal.";
      notes[1]="Stop loss fixo, calculo e protecao por perda.";
      notes[2]="Regras para mover o stop automaticamente.";
      notes[3]="Take profit fixo, calculo e projecao de lucro.";
      notes[4]="Break even e protecao sem prejuizo.";
      notes[5]="Trailing stop e acompanhamento dinamico.";
      notes[6]="Saidas fracionadas e gerenciamento parcial.";
      notes[7]="Gatilhos e filtros de sinal.";
      notes[8]="Acabamento final da estrategia.";
      notes[9]="Espaco reservado para o fluxo de montagem da estrategia.";

      for(int i=0;i<PARAM_TAB_COUNT;i++)
        {
         if(!CreateTextLabel(m_param_header_title[i],titles[i],m_param_tabs,m_window_index,m_param_tabs,i,header_x,header_y,header_w,header_title_h))
            continue;
         m_param_header_title[i].FontSize(18);
         m_param_header_title[i].LabelColor(C'43,43,43');

         if(!CreateTextLabel(m_param_header_note[i],notes[i],m_param_tabs,m_window_index,m_param_tabs,i,header_x,header_y+32,header_w,header_note_h))
            continue;
         m_param_header_note[i].FontSize(10);
         m_param_header_note[i].LabelColor(C'91,78,64');
        }
     }

   void CreateExecHeaders(void)
     {
      const int header_x=24;
      const int header_y=10;
      const int header_w=m_exec_tabs.XSize()-(header_x*2);
      const int header_title_h=28;
      const int header_note_h=18;

      string titles[];
      string notes[];
      ArrayResize(titles,EXEC_TAB_COUNT);
      ArrayResize(notes,EXEC_TAB_COUNT);
      titles[0]="1. Execucao";
      titles[1]="2. Painel";
      notes[0]="Fluxo operacional da estrategia, disparo e integracoes.";
      notes[1]="Visualizacao consolidada do painel e controles finais.";

      for(int i=0;i<EXEC_TAB_COUNT;i++)
        {
         if(!CreateTextLabel(m_exec_header_title[i],titles[i],m_exec_tabs,m_window_index,m_exec_tabs,i,header_x,header_y,header_w,header_title_h))
            continue;
         m_exec_header_title[i].FontSize(18);
         m_exec_header_title[i].LabelColor(C'43,43,43');

         if(!CreateTextLabel(m_exec_header_note[i],notes[i],m_exec_tabs,m_window_index,m_exec_tabs,i,header_x,header_y+32,header_w,header_note_h))
            continue;
         m_exec_header_note[i].FontSize(10);
         m_exec_header_note[i].LabelColor(C'91,78,64');
        }
     }

   void SaveVisiblePages(void)
     {
      m_tab1.Save();
      m_tab1.ExportSettings(m_settings);
      m_tab2.Save();
      m_tab2.ExportSettings(m_settings);
      m_tab3.Save();
      m_tab3.ExportSettings(m_settings);
      m_tab4.Save();
      m_tab4.ExportSettings(m_settings);
      m_tab5.Save();
      m_tab5.ExportSettings(m_settings);
      m_has_settings=true;
     }

public:
                        CConstrutorEasyPanelV2(void) :
                           m_created(false),
                           m_visible(false),
                           m_has_settings(false),
                           m_apply_requested(false),
                           m_window_index(-1),
                           m_top_tab_last(-1),
                           m_param_tab_last(-1),
                           m_exec_tab_last(-1)
                        {}

   void SetSettings(const SConstrutorSettings &settings)
     {
      m_settings=settings;
      m_has_settings=true;
      m_tab1.SetSettings(m_settings);
      m_tab2.SetSettings(m_settings);
      m_tab3.SetSettings(m_settings);
      m_tab4.SetSettings(m_settings);
      m_tab5.SetSettings(m_settings);
      if(m_created)
         m_tab1.Load();
      if(m_created)
         m_tab2.Load();
      if(m_created)
         m_tab3.Load();
      if(m_created)
         m_tab4.Load();
      if(m_created)
         m_tab5.Load();
     }

   bool ConsumeApply(SConstrutorSettings &settings)
     {
      if(!m_apply_requested || !m_has_settings)
         return(false);
      settings=m_settings;
      m_apply_requested=false;
      return(true);
     }

   bool IsVisible(void) const { return(m_visible); }
   bool IsCreated(void) const { return(m_created); }
   void OnTimerEvent(void) {}

   bool CreateIfNeeded(void)
     {
      if(m_created)
         return(true);

      int chart_w=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
      int chart_h=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
      if(chart_w<400) chart_w=1280;
      if(chart_h<300) chart_h=720;

      if(!CreateWindow(m_window,"Construtor | EasyPanel V2",0,0,chart_w,chart_h,true,true,true,true))
         return(false);

      m_window_index=WindowsTotal()-1;
      Hide();

      if(!CreateTextLabel(m_title,"Construtor (Easy GUI) | EasyPanel V2",m_window,m_window_index,16,40,520,22))
         return(false);
      m_title.FontSize(14);
      m_title.LabelColor(C'43,43,43');

      if(!CreateTextLabel(m_note,"Estrutura modular da V2 com abas superiores e laterais separadas por arquivo.",m_window,m_window_index,16,64,760,18))
         return(false);
      m_note.FontSize(10);
      m_note.LabelColor(C'91,78,64');

      const int padding=16;
      const int top_tabs_x=padding;
      const int top_tabs_y=92;
      const int top_tabs_w=chart_w-(padding*2);
      const int top_tabs_h=chart_h-top_tabs_y-padding;

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
      m_top_tabs.TabsYSize(30);
      m_top_tabs.AutoXResizeMode(true);
      m_top_tabs.AutoYResizeMode(true);
      m_top_tabs.AutoXResizeRightOffset(padding);
      m_top_tabs.AutoYResizeBottomOffset(padding);
      m_top_tabs.BackColorPressed(C'247,241,231');
      m_top_tabs.BorderColor(C'220,207,186');
      m_top_tabs.BorderColorHover(C'220,207,186');
      m_top_tabs.BorderColorPressed(C'220,207,186');

      for(int i=0;i<TOP_TAB_COUNT;i++)
         m_top_tabs.AddTab(top_text[i],top_widths[i]);

      if(!m_top_tabs.CreateTabs(top_tabs_x,top_tabs_y))
         return(false);
      AddToElementsArray(m_window_index,m_top_tabs);
      StyleTabsButtons(m_top_tabs,TOP_TAB_COUNT,false);

      string param_labels[];
      ArrayResize(param_labels,PARAM_TAB_COUNT);
      param_labels[0]="1. Inf. Iniciais";
      param_labels[1]="2. Stop loss";
      param_labels[2]="3. Stop movel";
      param_labels[3]="4. Take profit";
      param_labels[4]="5. Break even";
      param_labels[5]="6. Trailing stop";
      param_labels[6]="7. Saidas parciais";
      param_labels[7]="8. Sinais";
      param_labels[8]="9. Ajustes finais";
      param_labels[9]="10. Montagem";

      string exec_labels[];
      ArrayResize(exec_labels,EXEC_TAB_COUNT);
      exec_labels[0]="1. Execucao";
      exec_labels[1]="2. Painel";

      const int inner_pad=16;
      const int side_w=240;
      const int action_h=48;
      const int content_x=inner_pad+side_w;
      const int content_y=inner_pad;
      const int content_w=top_tabs_w-side_w-(inner_pad*2);
      const int content_h=top_tabs_h-(inner_pad*2)-action_h;

      if(!ConfigurePanelTabs(m_param_tabs,m_top_tabs,0,content_x,content_y,content_w,content_h,param_labels,PARAM_TAB_COUNT))
         return(false);
      if(!ConfigurePanelTabs(m_exec_tabs,m_top_tabs,1,content_x,content_y,content_w,content_h,exec_labels,EXEC_TAB_COUNT))
         return(false);

      CreateParamHeaders();
      CreateExecHeaders();

      if(!m_tab1.Create(*this,m_window_index,m_param_tabs,0))
         return(false);
      if(!m_tab2.Create(*this,m_window_index,m_param_tabs,1))
         return(false);
      if(!m_tab3.Create(*this,m_window_index,m_param_tabs,2))
         return(false);
      if(!m_tab4.Create(*this,m_window_index,m_param_tabs,3))
         return(false);
      if(!m_tab5.Create(*this,m_window_index,m_param_tabs,4))
         return(false);
      if(!m_tab6.Create(*this,m_window_index,m_param_tabs,5))
         return(false);
      if(!m_tab7.Create(*this,m_window_index,m_param_tabs,6))
         return(false);
      if(!m_tab8.Create(*this,m_window_index,m_param_tabs,7))
         return(false);
      if(!m_tab9.Create(*this,m_window_index,m_param_tabs,8))
         return(false);
      if(!m_tab10.Create(*this,m_window_index,m_param_tabs,9))
         return(false);
      if(!m_execucao.Create(*this,m_window_index,m_exec_tabs,0))
         return(false);
      if(!m_painel.Create(*this,m_window_index,m_exec_tabs,1))
         return(false);

      if(!CreateButton(m_btn_apply,"Aplicar",m_top_tabs,m_window_index,top_tabs_w-156,top_tabs_h-44,120,false,false,C'39,54,78',C'62,79,101',C'226,114,64',clrWhite,C'18,29,43'))
         return(false);
      m_top_tabs.AddToElementsArray(0,m_btn_apply);
      m_top_tabs.AddToElementsArray(1,m_btn_apply);

      if(m_has_settings)
        {
         m_tab1.Load();
         m_tab2.Load();
         m_tab3.Load();
         m_tab4.Load();
         m_tab5.Load();
        }

      m_top_tabs.SelectTab(0);
      m_param_tabs.SelectTab(0);
      m_exec_tabs.SelectTab(0);
      m_top_tabs.ShowTabElements();
      m_param_tabs.ShowTabElements();

      CompletedGUI();
      m_top_tab_last=0;
      m_param_tab_last=0;
      m_exec_tab_last=0;
      m_created=true;
      return(true);
     }

   bool ShowPanel(void)
     {
      if(!CreateIfNeeded())
         return(false);

      if(m_has_settings)
        {
         m_tab1.SetSettings(m_settings);
         m_tab1.Load();
         m_tab2.SetSettings(m_settings);
         m_tab2.Load();
         m_tab3.SetSettings(m_settings);
         m_tab3.Load();
         m_tab4.SetSettings(m_settings);
         m_tab4.Load();
         m_tab5.SetSettings(m_settings);
         m_tab5.Load();
        }

      Show((uint)m_window_index);
      m_top_tabs.ShowTabElements();
      if(m_top_tabs.SelectedTab()==0)
         m_param_tabs.ShowTabElements();
      else
         m_exec_tabs.ShowTabElements();
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
      m_param_tab_last=-1;
      m_exec_tab_last=-1;
     }

   void ChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      CEF_CWndCreate::ChartEvent(id,lparam,dparam,sparam);
      if(!m_created || !m_visible)
         return;

      if(m_tab2.HandleEvent(id,lparam,dparam,sparam))
         return;
      if(m_tab3.HandleEvent(id,lparam,dparam,sparam))
         return;
      if(m_tab4.HandleEvent(id,lparam,dparam,sparam))
         return;
      if(m_tab5.HandleEvent(id,lparam,dparam,sparam))
         return;

      if(id==CHARTEVENT_CUSTOM+ON_CLICK_BUTTON && m_btn_apply.CheckElementName(sparam))
        {
         SaveVisiblePages();
         m_apply_requested=true;
         Print("EasyPanel V2: estrutura aplicada");
         return;
        }

      const int top_selected=m_top_tabs.SelectedTab();
      if(top_selected!=m_top_tab_last)
        {
         m_top_tab_last=top_selected;
         if(top_selected==0)
            m_param_tabs.ShowTabElements();
         else
            m_exec_tabs.ShowTabElements();
        }

      if(top_selected==0)
        {
         const int selected=m_param_tabs.SelectedTab();
         if(selected!=m_param_tab_last)
           {
            m_param_tab_last=selected;
            m_param_tabs.ShowTabElements();
           }
        }
      else
        {
         const int selected=m_exec_tabs.SelectedTab();
         if(selected!=m_exec_tab_last)
           {
            m_exec_tab_last=selected;
            m_exec_tabs.ShowTabElements();
           }
        }
     }
  };

#endif // __CONSTRUTOR_EASY_PANEL_V2_MQH__
