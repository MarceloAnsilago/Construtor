#ifndef __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__
#define __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__

#include "Tab8Shared.mqh"

class CTab8MontarSlotCard : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate *m_host;
   bool            m_created;
   int             m_window_index;
   int             m_tab_index;
   int             m_slot_index;
   int             m_last_selected_index;

   CEF_CFrame      m_card;
   CEF_CTextLabel  m_title;
   CEF_CTextLabel  m_combo_label;
   CEF_CComboBox   m_combo;
   CEF_CFrame      m_body;
   CEF_CTabs       m_content_tabs;
   CEF_CTextLabel  m_param_title[19];
   CEF_CTextLabel  m_param_body[19];

   bool CreateComboControl(CEF_CComboBox &combo,CElement &owner,CEF_CTabs &tabs,const int tab_index,const int x,const int y,const int width,const int list_height,const string &items[],const int selected_index,const color border)
     {
      combo.MainPointer(owner);
      tabs.AddToElementsArray(tab_index,combo);
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

   void BuildIndicatorItems(string &items[])
     {
      ArrayResize(items,19);
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

public:
                     CTab8MontarSlotCard(void) : m_host(NULL), m_created(false), m_window_index(-1), m_tab_index(-1), m_slot_index(-1), m_last_selected_index(-1) {}

   bool Create(CEF_CWndCreate &host,const int window_index,CEF_CTabs &tabs,const int tab_index,const int slot_index,
               const int x,const int y,const int w,const int h)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;
      m_slot_index=slot_index;

      const color card_back=V2_COLOR_CARD_BACK;
      const color card_border=V2_COLOR_CARD_BORDER;
      const color field_border=V2_COLOR_FIELD_BORDER;
      const color sub_back=V2_COLOR_SURFACE;

      if(!V2CreateCard(*m_host,m_card,tabs,m_window_index,m_tab_index,x,y,w,h,card_back,card_border))
         return(false);

      const string title_text=StringFormat("Indicador %d",m_slot_index+1);
      if(!V2CreateCardTitle(*m_host,m_title,title_text,m_card,tabs,m_window_index,m_tab_index,16,12,w-32))
         return(false);

      if(!V2CreateFieldLabel(*m_host,m_combo_label,"Indicador",m_card,tabs,m_window_index,m_tab_index,16,40,w-32,16))
         return(false);

      string indicator_items[];
      BuildIndicatorItems(indicator_items);
      if(!CreateComboControl(m_combo,m_card,tabs,m_tab_index,16,58,w-32,220,indicator_items,0,field_border))
         return(false);

      if(!V2CreateCard(*m_host,m_body,tabs,m_window_index,m_tab_index,16,92,w-32,h-108,sub_back,card_border))
         return(false);

      m_content_tabs.MainPointer(m_body);
      tabs.AddToElementsArray(m_tab_index,m_content_tabs);
      m_content_tabs.XSize(w-56);
      m_content_tabs.YSize(h-132);
      m_content_tabs.IsCenterText(true);
      m_content_tabs.PositionMode(TABS_TOP);
      m_content_tabs.TabsYSize(0);
      m_content_tabs.AutoXResizeMode(false);
      m_content_tabs.AutoYResizeMode(false);
      m_content_tabs.BackColor(sub_back);
      m_content_tabs.BackColorHover(sub_back);
      m_content_tabs.BackColorPressed(sub_back);
      m_content_tabs.BorderColor(sub_back);
      m_content_tabs.BorderColorHover(sub_back);
      m_content_tabs.BorderColorPressed(sub_back);

      for(int i=0;i<19;i++)
         m_content_tabs.AddTab(IntegerToString(i),0);

      if(!m_content_tabs.CreateTabs(12,12))
         return(false);
      m_host.RegisterElement(m_window_index,m_content_tabs);

      CEF_CButtonsGroup *bg=m_content_tabs.GetButtonsGroupPointer();
      if(bg!=NULL)
        {
         for(int i=0;i<19;i++)
           {
            bg.GetButtonPointer(i).FontSize(1);
            bg.GetButtonPointer(i).LabelXGap(0);
            bg.GetButtonPointer(i).LabelYGap(0);
            bg.GetButtonPointer(i).BackColor(sub_back);
            bg.GetButtonPointer(i).BackColorHover(sub_back);
            bg.GetButtonPointer(i).BackColorPressed(sub_back);
            bg.GetButtonPointer(i).BorderColor(sub_back);
            bg.GetButtonPointer(i).BorderColorHover(sub_back);
            bg.GetButtonPointer(i).BorderColorPressed(sub_back);
            bg.GetButtonPointer(i).LabelColor(sub_back);
            bg.GetButtonPointer(i).LabelColorHover(sub_back);
            bg.GetButtonPointer(i).LabelColorPressed(sub_back);
           }
        }

      for(int i=0;i<19;i++)
        {
         string indicator_name=indicator_items[i];
         string placeholder_title;
         string placeholder_body;
         BuildPlaceholderText(indicator_name,placeholder_title,placeholder_body);

         if(!V2CreateFieldLabel(*m_host,m_param_title[i],placeholder_title,m_content_tabs,m_content_tabs,m_window_index,i,12,8,w-80,16))
            return(false);
         m_param_title[i].FontSize(i==0 ? 11 : 10);
         m_param_title[i].LabelColor(i==0 ? V2_COLOR_TEXT_PRIMARY : V2_COLOR_TEXT_SECONDARY);

         if(!m_host.CreateTextLabel(m_param_body[i],placeholder_body,m_content_tabs,m_window_index,m_content_tabs,i,12,32,w-80,72))
            return(false);
         m_param_body[i].FontSize(10);
         m_param_body[i].LabelColor(V2_COLOR_TEXT_SECONDARY);
        }

      m_combo.SelectItem(0);
      m_content_tabs.SelectTab(0);
      m_content_tabs.ShowTabElements();
      m_last_selected_index=0;
      m_created=true;
      return(true);
     }

   void OnTimerEvent(void)
     {
      if(!m_created)
         return;

      const int selected=V2ClampIndex(m_combo.GetListViewPointer().SelectedItemIndex(),0,18);
      if(selected==m_last_selected_index)
         return;

      m_last_selected_index=selected;
      m_content_tabs.SelectTab(selected);
      m_content_tabs.ShowTabElements();
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__
