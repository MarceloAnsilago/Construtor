#ifndef __CONSTRUTOR_V2_TAB8_SINAIS_MQH__
#define __CONSTRUTOR_V2_TAB8_SINAIS_MQH__

#include "..\\V2Shared.mqh"
#include "Tab8\\Tab8SinaisMainView.mqh"
#include "Tab8\\Tab8MontarMainView.mqh"

class CTab8SinaisV2 : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate        *m_host;
   bool                   m_created;
   int                    m_window_index;
   int                    m_tab_index;
   int                    m_last_selected_tab;

   CEF_CTabs              m_inner_tabs;
   CEF_CTextLabel         m_hint;
   CTab8SinaisMainView    m_sinais_view;
   CTab8MontarMainView    m_montar_view;

public:
                        CTab8SinaisV2(void) : m_host(NULL), m_created(false), m_window_index(-1), m_tab_index(-1), m_last_selected_tab(-1) {}

   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int tabs_w=tabs.XSize();
      const int tabs_h=tabs.YSize();
      const int tab_h=28;

      if(!m_host.CreateTextLabel(m_hint,"Arquitetura preparada para migracao gradual da aba 8. O objetivo aqui e separar navegacao, blocos e parametros antes de portar a logica completa.",tabs,m_window_index,tabs,m_tab_index,24,66,tabs_w-48,18))
         return(false);
      m_hint.FontSize(10);
      m_hint.LabelColor(V2_COLOR_TEXT_SECONDARY);

      string inner_text[];
      int inner_widths[];
      ArrayResize(inner_text,2);
      ArrayResize(inner_widths,2);
      inner_text[0]="Sinais";
      inner_text[1]="Montar sinais";
      inner_widths[0]=190;
      inner_widths[1]=220;

      m_inner_tabs.MainPointer(tabs);
      tabs.AddToElementsArray(m_tab_index,m_inner_tabs);
      m_inner_tabs.XSize(tabs_w);
      m_inner_tabs.YSize(tabs_h-94);
      m_inner_tabs.IsCenterText(true);
      m_inner_tabs.PositionMode(TABS_TOP);
      m_inner_tabs.TabsYSize(tab_h);
      m_inner_tabs.BackColorPressed(V2_COLOR_CARD_BACK);
      m_inner_tabs.BorderColor(V2_COLOR_CARD_BORDER);
      m_inner_tabs.BorderColorHover(V2_COLOR_CARD_BORDER);
      m_inner_tabs.BorderColorPressed(V2_COLOR_CARD_BORDER);

      for(int i=0;i<2;i++)
         m_inner_tabs.AddTab(inner_text[i],inner_widths[i]);

      if(!m_inner_tabs.CreateTabs(0,94))
         return(false);
      m_host.RegisterElement(m_window_index,m_inner_tabs);

      CEF_CButtonsGroup *bg=m_inner_tabs.GetButtonsGroupPointer();
      if(bg!=NULL)
        {
         for(int i=0;i<2;i++)
           {
            bg.GetButtonPointer(i).FontSize(9);
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

      if(!m_sinais_view.Create(*m_host,m_window_index,m_inner_tabs,0))
         return(false);
      if(!m_montar_view.Create(*m_host,m_window_index,m_inner_tabs,1))
         return(false);

      m_inner_tabs.SelectTab(0);
      m_inner_tabs.ShowTabElements();
      m_last_selected_tab=0;
      m_created=true;
      return(true);
     }

   void OnTimerEvent(void)
     {
      if(!m_created)
         return;

      const int selected=m_inner_tabs.SelectedTab();
      if(selected!=m_last_selected_tab)
        {
         m_last_selected_tab=selected;
         m_inner_tabs.ShowTabElements();
        }

      m_sinais_view.OnTimerEvent();
     }

   bool HandleEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      if(!m_created)
         return(false);

      if(m_sinais_view.HandleEvent(id,lparam,dparam,sparam))
         return(true);

      return(false);
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_SINAIS_MQH__
