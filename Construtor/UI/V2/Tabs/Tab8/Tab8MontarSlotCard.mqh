#ifndef __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__
#define __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__

#include "Tab8Shared.mqh"

class CTab8MontarSlotCard : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate *m_host;
   CEF_CTabs      *m_tabs;
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

   CEF_CTextLabel  m_obv_volume_label;
   CEF_CComboBox   m_obv_volume_combo;

   void RegisterTabElement(CElement &element)
     {
      if(m_tabs!=NULL)
         (*m_tabs).AddToElementsArray(m_tab_index,element);
     }

   bool CreateBodyLabel(CEF_CTextLabel &label,const string text,CElement &owner,const int x,const int y,const int width,const int height,const int font_size=10,const color text_color=clrNONE)
     {
      if(!m_host.CreateTextLabel(label,text,owner,m_window_index,x,y,width,height))
         return(false);
      RegisterTabElement(label);
      label.FontSize(font_size);
      label.LabelColor(text_color==clrNONE ? V2_COLOR_TEXT_SECONDARY : text_color);
      return(true);
     }

   bool CreateComboControl(CEF_CComboBox &combo,CElement &owner,const int x,const int y,const int width,const int list_height,string &items[],const int selected_index,const color border)
     {
      combo.MainPointer(owner);
      combo.ItemsTotal(ArraySize(items));
      for(int i=0;i<ArraySize(items);i++)
         combo.SetValue(i,items[i]);
      V2StyleCombo(combo,border,width,list_height,width-2);
      if(!combo.CreateComboBox("",x,y))
         return(false);
      RegisterTabElement(combo);
      m_host.RegisterElement(m_window_index,combo);
      combo.SelectItem(V2ClampIndex(selected_index,0,ArraySize(items)-1));
      return(true);
     }

   bool CreateSpinControl(CEF_CTextEdit &spin,CElement &owner,const int x,const int y,const int width,const double max_value,const double min_value,const double step,const int digits,const string value,const color back,const color border)
     {
      spin.MainPointer(owner);
      V2StyleSpin(spin,back,border,width,max_value,min_value,step,digits,value);
      if(!spin.CreateTextEdit("",x,y))
         return(false);
      RegisterTabElement(spin);
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

   void HideLabel(CEF_CTextLabel &label) { label.Hide(); }
   void ShowLabel(CEF_CTextLabel &label) { label.Show(); }
   void HideCombo(CEF_CComboBox &combo) { combo.Hide(); }
   void ShowCombo(CEF_CComboBox &combo) { combo.Show(); }
   void HideSpin(CEF_CTextEdit &spin) { spin.Hide(); }
   void ShowSpin(CEF_CTextEdit &spin) { spin.Show(); }

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

      HideLabel(m_ma_period_label);
      HideSpin(m_ma_period_spin);
      HideLabel(m_ma_shift_label);
      HideSpin(m_ma_shift_spin);
      HideLabel(m_ma_type_label);
      HideCombo(m_ma_type_combo);
      HideLabel(m_ma_price_label);
      HideCombo(m_ma_price_combo);

      HideLabel(m_macd_fast_label);
      HideSpin(m_macd_fast_spin);
      HideLabel(m_macd_slow_label);
      HideSpin(m_macd_slow_spin);
      HideLabel(m_macd_signal_label);
      HideSpin(m_macd_signal_spin);
      HideLabel(m_macd_price_label);
      HideCombo(m_macd_price_combo);

      HideLabel(m_obv_volume_label);
      HideCombo(m_obv_volume_combo);
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

   void ApplySelectedIndicator(const int selected)
     {
      string items[];
      BuildIndicatorItems(items);
      const int safe_index=V2ClampIndex(selected,0,ArraySize(items)-1);

      if(safe_index==3)
        {
         ShowRegressaoView();
         return;
        }
      if(safe_index==7)
        {
         ShowMediaMovelView();
         return;
        }
      if(safe_index==11)
        {
         ShowRSIView();
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

      string placeholder_title;
      string placeholder_body;
      BuildPlaceholderText(items[safe_index],placeholder_title,placeholder_body);
      ShowPlaceholderView(placeholder_title,placeholder_body);
     }

public:
                     CTab8MontarSlotCard(void) : m_host(NULL), m_tabs(NULL), m_created(false), m_window_index(-1), m_tab_index(-1), m_slot_index(-1), m_last_selected_index(-1) {}

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

      int y_cursor=content_y+18;
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
      if(!CreateBodyLabel(m_obv_volume_label,"Volume",m_body,content_x,y_cursor,inner_w,16))
         return(false);
      y_cursor+=16;
      if(!CreateComboControl(m_obv_volume_combo,m_body,content_x,y_cursor,inner_w,80,volume_items,0,field_border))
         return(false);

      m_combo.SelectItem(0);
      ApplySelectedIndicator(0);
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
      ApplySelectedIndicator(selected);
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_MONTAR_SLOT_CARD_MQH__
