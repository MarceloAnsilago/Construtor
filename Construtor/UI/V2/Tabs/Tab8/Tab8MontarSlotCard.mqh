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
   CEF_CTextLabel  m_rsi_period_label;
   CEF_CTextEdit   m_rsi_period_spin;
   CEF_CTextLabel  m_rsi_price_label;
   CEF_CComboBox   m_rsi_price_combo;
   CEF_CTextLabel  m_fractal_empty_label;
   CEF_CTextLabel  m_ma_period_label;
   CEF_CTextEdit   m_ma_period_spin;
   CEF_CTextLabel  m_ma_shift_label;
   CEF_CTextEdit   m_ma_shift_spin;
   CEF_CTextLabel  m_ma_type_label;
   CEF_CComboBox   m_ma_type_combo;
   CEF_CTextLabel  m_ma_price_label;
   CEF_CComboBox   m_ma_price_combo;
   CEF_CTextLabel  m_macd_fast_label;
   CEF_CTextEdit   m_macd_fast_spin;
   CEF_CTextLabel  m_macd_slow_label;
   CEF_CTextEdit   m_macd_slow_spin;
   CEF_CTextLabel  m_macd_signal_label;
   CEF_CTextEdit   m_macd_signal_spin;
   CEF_CTextLabel  m_macd_price_label;
   CEF_CComboBox   m_macd_price_combo;

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

   bool CreateSpinControl(CEF_CTextEdit &spin,CElement &owner,CEF_CTabs &tabs,const int tab_index,const int x,const int y,const int width,const double max_value,const double min_value,const double step,const int digits,const string value,const color back,const color border)
     {
      spin.MainPointer(owner);
      tabs.AddToElementsArray(tab_index,spin);
      V2StyleSpin(spin,back,border,width,max_value,min_value,step,digits,value);
      if(!spin.CreateTextEdit("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,spin);
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

   bool CreateMediaMovelTab(const int tab_index,const int width,const color sub_back,const color border,const string &price_items[],const string &ma_type_items[])
     {
      const int x=12;
      const int w=width-24;
      int y=32;
      if(!V2CreateFieldLabel(*m_host,m_ma_period_label,"Periodo",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_ma_period_spin,m_content_tabs,m_content_tabs,tab_index,x,y,w,9999.0,0.0,1.0,0,"14",sub_back,border))
         return(false);
      y+=32;
      if(!V2CreateFieldLabel(*m_host,m_ma_shift_label,"Deslocamento",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_ma_shift_spin,m_content_tabs,m_content_tabs,tab_index,x,y,w,9999.0,0.0,1.0,0,"0",sub_back,border))
         return(false);
      y+=32;
      if(!V2CreateFieldLabel(*m_host,m_ma_type_label,"Tipo de media",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_ma_type_combo,m_content_tabs,m_content_tabs,tab_index,x,y,w,120,ma_type_items,0,border))
         return(false);
      y+=32;
      if(!V2CreateFieldLabel(*m_host,m_ma_price_label,"Modo de preco",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_ma_price_combo,m_content_tabs,m_content_tabs,tab_index,x,y,w,160,price_items,0,border))
         return(false);
      return(true);
     }

   bool CreateRSITab(const int tab_index,const int width,const color sub_back,const color border,const string &price_items[])
     {
      const int x=12;
      const int w=width-24;
      int y=32;
      if(!V2CreateFieldLabel(*m_host,m_rsi_period_label,"Periodo",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_rsi_period_spin,m_content_tabs,m_content_tabs,tab_index,x,y,w,9999.0,0.0,1.0,0,"14",sub_back,border))
         return(false);
      y+=32;
      if(!V2CreateFieldLabel(*m_host,m_rsi_price_label,"Modo de preco",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_rsi_price_combo,m_content_tabs,m_content_tabs,tab_index,x,y,w,160,price_items,0,border))
         return(false);
      return(true);
     }

   bool CreateFractalTab(const int tab_index,const int width)
     {
      if(!m_host.CreateTextLabel(m_fractal_empty_label,"Sem parametros",m_content_tabs,m_window_index,m_content_tabs,tab_index,12,32,width-24,20))
         return(false);
      m_fractal_empty_label.FontSize(10);
      m_fractal_empty_label.LabelColor(V2_COLOR_TEXT_SECONDARY);
      return(true);
     }

   bool CreateMACDTab(const int tab_index,const int width,const color sub_back,const color border,const string &price_items[])
     {
      const int x=12;
      const int w=width-24;
      int y=32;
      if(!V2CreateFieldLabel(*m_host,m_macd_fast_label,"EMA rapida",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_macd_fast_spin,m_content_tabs,m_content_tabs,tab_index,x,y,w,9999.0,0.0,1.0,0,"12",sub_back,border))
         return(false);
      y+=32;
      if(!V2CreateFieldLabel(*m_host,m_macd_slow_label,"EMA lenta",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_macd_slow_spin,m_content_tabs,m_content_tabs,tab_index,x,y,w,9999.0,0.0,1.0,0,"26",sub_back,border))
         return(false);
      y+=32;
      if(!V2CreateFieldLabel(*m_host,m_macd_signal_label,"Sinal",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_macd_signal_spin,m_content_tabs,m_content_tabs,tab_index,x,y,w,9999.0,0.0,1.0,0,"9",sub_back,border))
         return(false);
      y+=32;
      if(!V2CreateFieldLabel(*m_host,m_macd_price_label,"Modo de preco",m_content_tabs,m_content_tabs,m_window_index,tab_index,x,y,w,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_macd_price_combo,m_content_tabs,m_content_tabs,tab_index,x,y,w,160,price_items,0,border))
         return(false);
      return(true);
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
      const int card_pad=16;
      const int body_x=44;
      const int body_y=124;
      const int body_w=w-60;
      const int body_h=h-144;
      const int content_x=16;
      const int content_y=16;
      const int inner_w=body_w-(content_x*2);
      const int inner_h=body_h-(content_y*2);

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

      if(!V2CreateCard(*m_host,m_body,tabs,m_window_index,m_tab_index,body_x,body_y,body_w,body_h,sub_back,card_border))
         return(false);

      m_content_tabs.MainPointer(m_body);
      tabs.AddToElementsArray(m_tab_index,m_content_tabs);
      m_content_tabs.XSize(inner_w);
      m_content_tabs.YSize(inner_h);
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

      if(!m_content_tabs.CreateTabs(content_x,content_y))
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

         if(!V2CreateFieldLabel(*m_host,m_param_title[i],placeholder_title,m_content_tabs,m_content_tabs,m_window_index,i,12,8,inner_w-24,16))
            return(false);
         m_param_title[i].FontSize(i==0 ? 11 : 10);
         m_param_title[i].LabelColor(i==0 ? V2_COLOR_TEXT_PRIMARY : V2_COLOR_TEXT_SECONDARY);

         if(!m_host.CreateTextLabel(m_param_body[i],placeholder_body,m_content_tabs,m_window_index,m_content_tabs,i,12,32,inner_w-24,72))
            return(false);
         m_param_body[i].FontSize(10);
         m_param_body[i].LabelColor(V2_COLOR_TEXT_SECONDARY);
        }

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

      if(!CreateMediaMovelTab(7,inner_w,sub_back,field_border,price_items,ma_type_items))
         return(false);
      if(!CreateRSITab(11,inner_w,sub_back,field_border,price_items))
         return(false);
      if(!CreateFractalTab(16,inner_w))
         return(false);
      if(!CreateMACDTab(18,inner_w,sub_back,field_border,price_items))
         return(false);

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
