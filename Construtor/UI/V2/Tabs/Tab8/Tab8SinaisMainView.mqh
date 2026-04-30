#ifndef __CONSTRUTOR_V2_TAB8_SINAIS_MAIN_VIEW_MQH__
#define __CONSTRUTOR_V2_TAB8_SINAIS_MAIN_VIEW_MQH__

#include "Tab8Shared.mqh"

class CTab8SinaisMainView : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate *m_host;
   bool            m_created;
   int             m_window_index;
   int             m_tab_index;
   int             m_last_ord_tab;

   CEF_CFrame      m_card_ordens;
   CEF_CTextLabel  m_card_ordens_title;
   CEF_CCheckBox   m_ordem_market;
   CEF_CCheckBox   m_ordem_limit;
   CEF_CTabs       m_ord_tabs;
   CEF_CCheckBox   m_ord_ref_check;
   CEF_CCheckBox   m_ord_media_check;
   CEF_CFrame      m_ord_ref_card;
   CEF_CFrame      m_ord_media_card;
   CEF_CTextLabel  m_ord_ref_base_label;
   CEF_CComboBox   m_ord_ref_base_combo;
   CEF_CTextLabel  m_ord_ref_candle_label;
   CEF_CComboBox   m_ord_ref_candle_combo;
   CEF_CTextLabel  m_ord_ref_distance_label;
   CEF_CTextEdit   m_ord_ref_distance_spin;
   CEF_CTextLabel  m_ord_ref_expire_label;
   CEF_CComboBox   m_ord_ref_expire_combo;
   CEF_CTextLabel  m_ord_media_candles_label;
   CEF_CTextEdit   m_ord_media_candles_spin;
   CEF_CTextLabel  m_ord_media_base_label;
   CEF_CComboBox   m_ord_media_base_combo;
   CEF_CTextLabel  m_ord_media_distance_label;
   CEF_CTextEdit   m_ord_media_distance_spin;
   CEF_CTextLabel  m_ord_media_expire_label;
   CEF_CComboBox   m_ord_media_expire_combo;

   CEF_CFrame      m_card_filtro;
   CEF_CTextLabel  m_card_filtro_title;
   CEF_CCheckBox   m_use_filtro;
   CEF_CTextLabel  m_filtro_padrao_label;
   CEF_CComboBox   m_filtro_padrao_combo;
   CEF_CTextLabel  m_filtro_time_label;
   CEF_CComboBox   m_filtro_time_combo;
   CEF_CTextLabel  m_filtro_range_label[4];
   CEF_CTextEdit   m_filtro_range_spin[4];

   CEF_CFrame      m_card_canais;
   CEF_CTextLabel  m_card_canais_title;
   CEF_CTextLabel  m_canais_label;
   CEF_CCheckBox   m_canais_yes;
   CEF_CCheckBox   m_canais_no;
   CEF_CTextLabel  m_canais_indic_label;
   CEF_CComboBox   m_canais_indic_combo;
   CEF_CTextLabel  m_canais_type_label;
   CEF_CComboBox   m_canais_type_combo;
   CEF_CTextLabel  m_canais_period_label;
   CEF_CTextEdit   m_canais_period_spin;
   CEF_CTextLabel  m_canais_deviation_label;
   CEF_CTextEdit   m_canais_deviation_spin;
   CEF_CTextLabel  m_canais_shift_label;
   CEF_CTextEdit   m_canais_shift_spin;
   CEF_CTextLabel  m_canais_price_label;
   CEF_CComboBox   m_canais_price_combo;
   CEF_CFrame      m_card_cruz;
   CEF_CTextLabel  m_card_cruz_title;
   CEF_CTextLabel  m_card_cruz_body;
   CEF_CFrame      m_card_sobre;
   CEF_CTextLabel  m_card_sobre_title;
   CEF_CCheckBox   m_use_sobre;
   CEF_CTabs       m_sobre_tabs;
   CEF_CTextLabel  m_sobre_indic_label;
   CEF_CComboBox   m_sobre_indic_combo;
   CEF_CTextLabel  m_sobre_entry_label;
   CEF_CComboBox   m_sobre_entry_combo;
   CEF_CTextLabel  m_sobre_sobrecompra_label;
   CEF_CTextEdit   m_sobre_sobrecompra_spin;
   CEF_CTextLabel  m_sobre_sobrevenda_label;
   CEF_CTextEdit   m_sobre_sobrevenda_spin;
   CEF_CTextLabel  m_sobre_sentido_label;
   CEF_CComboBox   m_sobre_sentido_combo;
   CEF_CTextLabel  m_sobre_param_hint;

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

   void RefreshOrderChecks(void)
     {
      m_ordem_market.Update(true);
      m_ordem_limit.Update(true);
      m_ord_ref_check.Update(true);
      m_ord_media_check.Update(true);
     }

   void RefreshCanaisChecks(void)
     {
      m_canais_yes.Update(true);
      m_canais_no.Update(true);
     }

   void SyncOrderTabChecks(void)
     {
      if(!m_created)
         return;

      const int selected=m_ord_tabs.SelectedTab();
      if(selected==m_last_ord_tab)
         return;

      m_last_ord_tab=selected;
      const bool use_ref=(selected!=1);
      m_ord_ref_check.IsPressed(use_ref);
      m_ord_media_check.IsPressed(!use_ref);
      m_ord_tabs.ShowTabElements();
      m_ord_ref_check.Update(true);
      m_ord_media_check.Update(true);
     }

public:
                     CTab8SinaisMainView(void) : m_host(NULL), m_created(false), m_window_index(-1), m_tab_index(-1), m_last_ord_tab(-1) {}

   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int tabs_w=tabs.XSize();
      const int content_pad=24;
      const int content_y=44;
      const int content_w=tabs_w-(content_pad*2);
      const int gap=12;
      const int col_w=(content_w-(gap*4))/5;
      const int card_h=520;
      const int field_x=16;
      const int field_w=col_w-32;
      const color card_back=V2_COLOR_CARD_BACK;
      const color card_border=V2_COLOR_CARD_BORDER;
      const color sub_back=V2_COLOR_SURFACE;
      const color field_border=V2_COLOR_FIELD_BORDER;

      if(!V2CreateCard(*m_host,m_card_ordens,tabs,m_window_index,m_tab_index,content_pad,content_y,col_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_ordens_title,"Tipo de ordens",m_card_ordens,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);

      const int order_gap=12;
      const int order_w=(field_w-order_gap)/2;
      if(!m_host.CreateCheckbox(m_ordem_market,"Mercado",m_card_ordens,m_window_index,tabs,m_tab_index,16,44,order_w,true,false,false))
         return(false);
      m_ordem_market.FontSize(10);
      m_ordem_market.LabelColor(V2_COLOR_TEXT_PRIMARY);

      if(!m_host.CreateCheckbox(m_ordem_limit,"Limite",m_card_ordens,m_window_index,tabs,m_tab_index,16+order_w+order_gap,44,order_w,false,false,false))
         return(false);
      m_ordem_limit.FontSize(10);
      m_ordem_limit.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string ord_tab_text[];
      int ord_tab_widths[];
      ArrayResize(ord_tab_text,2);
      ArrayResize(ord_tab_widths,2);
      ord_tab_text[0]="Referencia";
      ord_tab_text[1]="Media";
      ord_tab_widths[0]=(field_w/2);
      ord_tab_widths[1]=field_w-ord_tab_widths[0];

      m_ord_tabs.MainPointer(m_card_ordens);
      tabs.AddToElementsArray(m_tab_index,m_ord_tabs);
      m_ord_tabs.XSize(field_w);
      m_ord_tabs.YSize(card_h-96);
      m_ord_tabs.IsCenterText(true);
      m_ord_tabs.PositionMode(TABS_TOP);
      m_ord_tabs.TabsYSize(22);
      m_ord_tabs.AutoXResizeMode(false);
      m_ord_tabs.AutoYResizeMode(false);
      m_ord_tabs.BackColorPressed(sub_back);
      m_ord_tabs.BorderColor(card_border);
      m_ord_tabs.BorderColorHover(card_border);
      m_ord_tabs.BorderColorPressed(card_border);
      for(int i=0;i<2;i++)
         m_ord_tabs.AddTab(ord_tab_text[i],ord_tab_widths[i]);
      if(!m_ord_tabs.CreateTabs(16,84))
         return(false);
      m_host.RegisterElement(m_window_index,m_ord_tabs);

      CEF_CButtonsGroup *ord_bg=m_ord_tabs.GetButtonsGroupPointer();
      if(ord_bg!=NULL)
        {
         for(int i=0;i<2;i++)
           {
            ord_bg.GetButtonPointer(i).FontSize(8);
            ord_bg.GetButtonPointer(i).BackColor(C'39,54,78');
            ord_bg.GetButtonPointer(i).BackColorHover(C'62,79,101');
            ord_bg.GetButtonPointer(i).BackColorPressed(C'226,114,64');
            ord_bg.GetButtonPointer(i).BorderColor(C'18,29,43');
            ord_bg.GetButtonPointer(i).BorderColorHover(C'62,79,101');
            ord_bg.GetButtonPointer(i).BorderColorPressed(C'240,140,86');
            ord_bg.GetButtonPointer(i).LabelColor(clrWhite);
            ord_bg.GetButtonPointer(i).LabelColorHover(clrWhite);
            ord_bg.GetButtonPointer(i).LabelColorPressed(clrWhite);
           }
        }

      const int ord_content_x=12;
      const int ord_content_y=6;
      const int ord_content_w=field_w-(ord_content_x*2);
      const int ord_sub_y=ord_content_y+18;
      const int ord_sub_h=(card_h-96)-ord_sub_y-10;

      if(!m_host.CreateCheckbox(m_ord_ref_check,"Referencia",m_ord_tabs,m_window_index,m_ord_tabs,0,ord_content_x,ord_content_y,140,true,false,false))
         return(false);
      m_ord_ref_check.FontSize(10);
      m_ord_ref_check.LabelColor(V2_COLOR_TEXT_PRIMARY);

      if(!m_host.CreateCheckbox(m_ord_media_check,"Media",m_ord_tabs,m_window_index,m_ord_tabs,1,ord_content_x,ord_content_y,140,false,false,false))
         return(false);
      m_ord_media_check.FontSize(10);
      m_ord_media_check.LabelColor(V2_COLOR_TEXT_PRIMARY);

      if(!V2CreateCard(*m_host,m_ord_ref_card,m_ord_tabs,m_window_index,0,ord_content_x,ord_sub_y,ord_content_w,ord_sub_h,sub_back,card_border))
         return(false);
      if(!V2CreateCard(*m_host,m_ord_media_card,m_ord_tabs,m_window_index,1,ord_content_x,ord_sub_y,ord_content_w,ord_sub_h,sub_back,card_border))
         return(false);

      string base_items[];
      ArrayResize(base_items,6);
      base_items[0]="Maxima";
      base_items[1]="Minima";
      base_items[2]="Abertura";
      base_items[3]="Fechamento";
      base_items[4]="Corpo";
      base_items[5]="Pavios";

      string candle_items[];
      V2ItemsPosicaoReferencia(candle_items);

      string expire_items[];
      V2ItemsExpirar(expire_items);

      int y=10;
      if(!V2CreateFieldLabel(*m_host,m_ord_ref_base_label,"Referencia:",m_ord_ref_card,m_ord_tabs,m_window_index,0,field_x,y,ord_content_w-24,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_ord_ref_base_combo,m_ord_ref_card,m_ord_tabs,0,field_x,y,ord_content_w-24,120,base_items,0,card_border))
         return(false);
      y+=28;
      if(!V2CreateFieldLabel(*m_host,m_ord_ref_candle_label,"Candle:",m_ord_ref_card,m_ord_tabs,m_window_index,0,field_x,y,ord_content_w-24,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_ord_ref_candle_combo,m_ord_ref_card,m_ord_tabs,0,field_x,y,ord_content_w-24,120,candle_items,0,card_border))
         return(false);
      y+=28;
      if(!V2CreateFieldLabel(*m_host,m_ord_ref_distance_label,"Distancia",m_ord_ref_card,m_ord_tabs,m_window_index,0,field_x,y,ord_content_w-24,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_ord_ref_distance_spin,m_ord_ref_card,m_ord_tabs,0,field_x,y,ord_content_w-24,9999.0,0.0,1.0,0,"0",sub_back,card_border))
         return(false);
      y+=28;
      if(!V2CreateFieldLabel(*m_host,m_ord_ref_expire_label,"Expirar:",m_ord_ref_card,m_ord_tabs,m_window_index,0,field_x,y,ord_content_w-24,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_ord_ref_expire_combo,m_ord_ref_card,m_ord_tabs,0,field_x,y,ord_content_w-24,120,expire_items,0,card_border))
         return(false);

      y=10;
      if(!V2CreateFieldLabel(*m_host,m_ord_media_candles_label,"Cand. media",m_ord_media_card,m_ord_tabs,m_window_index,1,field_x,y,ord_content_w-24,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_ord_media_candles_spin,m_ord_media_card,m_ord_tabs,1,field_x,y,ord_content_w-24,9999.0,0.0,1.0,0,"0",sub_back,card_border))
         return(false);
      y+=28;
      if(!V2CreateFieldLabel(*m_host,m_ord_media_base_label,"Referencia:",m_ord_media_card,m_ord_tabs,m_window_index,1,field_x,y,ord_content_w-24,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_ord_media_base_combo,m_ord_media_card,m_ord_tabs,1,field_x,y,ord_content_w-24,120,base_items,0,card_border))
         return(false);
      y+=28;
      if(!V2CreateFieldLabel(*m_host,m_ord_media_distance_label,"Distancia",m_ord_media_card,m_ord_tabs,m_window_index,1,field_x,y,ord_content_w-24,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_ord_media_distance_spin,m_ord_media_card,m_ord_tabs,1,field_x,y,ord_content_w-24,9999.0,0.0,1.0,0,"0",sub_back,card_border))
         return(false);
      y+=28;
      if(!V2CreateFieldLabel(*m_host,m_ord_media_expire_label,"Expirar:",m_ord_media_card,m_ord_tabs,m_window_index,1,field_x,y,ord_content_w-24,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_ord_media_expire_combo,m_ord_media_card,m_ord_tabs,1,field_x,y,ord_content_w-24,120,expire_items,0,card_border))
         return(false);

      m_ord_tabs.SelectTab(0);
      m_ord_tabs.ShowTabElements();
      m_last_ord_tab=0;

      const int filtro_x=content_pad+col_w+gap;
      if(!V2CreateCard(*m_host,m_card_filtro,tabs,m_window_index,m_tab_index,filtro_x,content_y,col_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_filtro_title,"Usar filtro",m_card_filtro,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_filtro,"Ativar filtro",m_card_filtro,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_filtro.FontSize(10);
      m_use_filtro.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string stop_type_items[];
      V2ItemsStopTipo(stop_type_items);
      string tf_items[];
      V2ItemsTempoGrafico(tf_items);

      y=76;
      if(!V2CreateFieldLabel(*m_host,m_filtro_padrao_label,"Medir em",m_card_filtro,tabs,m_window_index,m_tab_index,field_x,y,field_w,18))
         return(false);
      y+=22;
      if(!CreateComboControl(m_filtro_padrao_combo,m_card_filtro,tabs,m_tab_index,field_x,y,field_w,80,stop_type_items,0,field_border))
         return(false);
      y+=42;
      if(!V2CreateFieldLabel(*m_host,m_filtro_time_label,"Tempo grafico",m_card_filtro,tabs,m_window_index,m_tab_index,field_x,y,field_w,18))
         return(false);
      y+=22;
      if(!CreateComboControl(m_filtro_time_combo,m_card_filtro,tabs,m_tab_index,field_x,y,field_w,200,tf_items,0,field_border))
         return(false);
      y+=42;

      string filter_labels[];
      ArrayResize(filter_labels,4);
      filter_labels[0]="Tam. min da vela";
      filter_labels[1]="Tam. max";
      filter_labels[2]="Min. pavios";
      filter_labels[3]="Max. pavios";

      for(int i=0;i<4;i++)
        {
         if(!V2CreateFieldLabel(*m_host,m_filtro_range_label[i],filter_labels[i],m_card_filtro,tabs,m_window_index,m_tab_index,field_x,y,field_w,16))
            return(false);
         y+=18;
         if(!CreateSpinControl(m_filtro_range_spin[i],m_card_filtro,tabs,m_tab_index,field_x,y,field_w,9999.0,0.0,1.0,0,"0",card_back,field_border))
            return(false);
         y+=28;
        }

      const int canais_x=content_pad+(col_w+gap)*2;
      if(!V2CreateCard(*m_host,m_card_canais,tabs,m_window_index,m_tab_index,canais_x,content_y,col_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_canais_title,"Canais de bandas",m_card_canais,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!V2CreateFieldLabel(*m_host,m_canais_label,"Usar canais de bandas?",m_card_canais,tabs,m_window_index,m_tab_index,16,40,field_w,18))
         return(false);
      if(!m_host.CreateCheckbox(m_canais_yes,"Sim",m_card_canais,m_window_index,tabs,m_tab_index,16,58,60,false,false,false))
         return(false);
      m_canais_yes.FontSize(10);
      m_canais_yes.LabelColor(V2_COLOR_TEXT_SECONDARY);
      if(!m_host.CreateCheckbox(m_canais_no,"Nao",m_card_canais,m_window_index,tabs,m_tab_index,86,58,60,true,false,false))
         return(false);
      m_canais_no.FontSize(10);
      m_canais_no.LabelColor(V2_COLOR_TEXT_SECONDARY);

      string canais_indic_items[];
      ArrayResize(canais_indic_items,5);
      canais_indic_items[0]="Bandas de Bollinger";
      canais_indic_items[1]="Envelope";
      canais_indic_items[2]="Keltner";
      canais_indic_items[3]="Donchian";
      canais_indic_items[4]="Canal ATR";

      string canais_type_items[];
      ArrayResize(canais_type_items,6);
      canais_type_items[0]="Fechou fora";
      canais_type_items[1]="Fechou dentro e saiu";
      canais_type_items[2]="Fechou dentro e fechou fora";
      canais_type_items[3]="Fechou fora e voltou";
      canais_type_items[4]="Fechou fora e fechou dentro";
      canais_type_items[5]="Estando fora";

      string canais_price_items[];
      ArrayResize(canais_price_items,7);
      canais_price_items[0]="Fechamento";
      canais_price_items[1]="Abertura";
      canais_price_items[2]="Maximo";
      canais_price_items[3]="Minimo";
      canais_price_items[4]="Mediano";
      canais_price_items[5]="Tipico";
      canais_price_items[6]="Medio";

      y=84;
      if(!V2CreateFieldLabel(*m_host,m_canais_indic_label,"Indicador",m_card_canais,tabs,m_window_index,m_tab_index,field_x,y,field_w,16))
         return(false);
      y+=16;
      if(!CreateComboControl(m_canais_indic_combo,m_card_canais,tabs,m_tab_index,field_x,y,field_w,120,canais_indic_items,0,field_border))
         return(false);
      y+=40;
      if(!V2CreateFieldLabel(*m_host,m_canais_type_label,"Sinais",m_card_canais,tabs,m_window_index,m_tab_index,field_x,y,field_w,16))
         return(false);
      y+=16;
      if(!CreateComboControl(m_canais_type_combo,m_card_canais,tabs,m_tab_index,field_x,y,field_w,160,canais_type_items,0,field_border))
         return(false);

      const int canais_spin_y=174;
      const int canais_spin_w=(field_w-12)/2;
      if(!V2CreateFieldLabel(*m_host,m_canais_period_label,"Periodo",m_card_canais,tabs,m_window_index,m_tab_index,field_x,canais_spin_y,canais_spin_w,16))
         return(false);
      if(!CreateSpinControl(m_canais_period_spin,m_card_canais,tabs,m_tab_index,field_x,canais_spin_y+18,canais_spin_w,9999.0,0.0,1.0,0,"20",card_back,field_border))
         return(false);
      if(!V2CreateFieldLabel(*m_host,m_canais_deviation_label,"Desvio",m_card_canais,tabs,m_window_index,m_tab_index,field_x+canais_spin_w+12,canais_spin_y,canais_spin_w,16))
         return(false);
      if(!CreateSpinControl(m_canais_deviation_spin,m_card_canais,tabs,m_tab_index,field_x+canais_spin_w+12,canais_spin_y+18,canais_spin_w,9999.0,0.0,0.1,1,"2.0",card_back,field_border))
         return(false);
      if(!V2CreateFieldLabel(*m_host,m_canais_shift_label,"Deslocamento",m_card_canais,tabs,m_window_index,m_tab_index,field_x,222,field_w,16))
         return(false);
      if(!CreateSpinControl(m_canais_shift_spin,m_card_canais,tabs,m_tab_index,field_x,240,field_w,9999.0,0.0,1.0,0,"0",card_back,field_border))
         return(false);
      if(!V2CreateFieldLabel(*m_host,m_canais_price_label,"Modo de preco",m_card_canais,tabs,m_window_index,m_tab_index,field_x,268,field_w,16))
         return(false);
      if(!CreateComboControl(m_canais_price_combo,m_card_canais,tabs,m_tab_index,field_x,286,field_w,160,canais_price_items,0,field_border))
         return(false);

      const int cruz_x=content_pad+(col_w+gap)*3;
      if(!V2CreateSectionPlaceholder(*m_host,m_card_cruz,m_card_cruz_title,m_card_cruz_body,tabs,tabs,m_window_index,m_tab_index,cruz_x,content_y,col_w,card_h,"Cruzamentos","Bloco mais sensivel de Sinais. Depende de tabs internas, atalhos e combinacao fast/slow."))
         return(false);
      const int sobre_x=content_pad+(col_w+gap)*4;
      if(!V2CreateCard(*m_host,m_card_sobre,tabs,m_window_index,m_tab_index,sobre_x,content_y,col_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_sobre_title,"Sobrecomprado / sobrevenda",m_card_sobre,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_sobre,"Usar sobrecomprado / sobrevenda",m_card_sobre,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_sobre.FontSize(10);
      m_use_sobre.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string sobre_tab_text[];
      int sobre_tab_widths[];
      ArrayResize(sobre_tab_text,2);
      ArrayResize(sobre_tab_widths,2);
      sobre_tab_text[0]="Indicador";
      sobre_tab_text[1]="Parametros";
      sobre_tab_widths[0]=field_w/2;
      sobre_tab_widths[1]=field_w-sobre_tab_widths[0];

      m_sobre_tabs.MainPointer(m_card_sobre);
      tabs.AddToElementsArray(m_tab_index,m_sobre_tabs);
      m_sobre_tabs.XSize(field_w);
      m_sobre_tabs.YSize(card_h-96);
      m_sobre_tabs.IsCenterText(true);
      m_sobre_tabs.PositionMode(TABS_TOP);
      m_sobre_tabs.TabsYSize(22);
      m_sobre_tabs.AutoXResizeMode(false);
      m_sobre_tabs.AutoYResizeMode(false);
      m_sobre_tabs.BackColorPressed(sub_back);
      m_sobre_tabs.BorderColor(card_border);
      m_sobre_tabs.BorderColorHover(card_border);
      m_sobre_tabs.BorderColorPressed(card_border);
      for(int i=0;i<2;i++)
         m_sobre_tabs.AddTab(sobre_tab_text[i],sobre_tab_widths[i]);
      if(!m_sobre_tabs.CreateTabs(16,84))
         return(false);
      m_host.RegisterElement(m_window_index,m_sobre_tabs);

      CEF_CButtonsGroup *sobre_bg=m_sobre_tabs.GetButtonsGroupPointer();
      if(sobre_bg!=NULL)
        {
         for(int i=0;i<2;i++)
           {
            sobre_bg.GetButtonPointer(i).FontSize(8);
            sobre_bg.GetButtonPointer(i).BackColor(C'39,54,78');
            sobre_bg.GetButtonPointer(i).BackColorHover(C'62,79,101');
            sobre_bg.GetButtonPointer(i).BackColorPressed(C'226,114,64');
            sobre_bg.GetButtonPointer(i).BorderColor(C'18,29,43');
            sobre_bg.GetButtonPointer(i).BorderColorHover(C'62,79,101');
            sobre_bg.GetButtonPointer(i).BorderColorPressed(C'240,140,86');
            sobre_bg.GetButtonPointer(i).LabelColor(clrWhite);
            sobre_bg.GetButtonPointer(i).LabelColorHover(clrWhite);
            sobre_bg.GetButtonPointer(i).LabelColorPressed(clrWhite);
           }
        }

      string sobre_indic_items[];
      ArrayResize(sobre_indic_items,10);
      sobre_indic_items[0]="MACD";
      sobre_indic_items[1]="Estocastico";
      sobre_indic_items[2]="RSI";
      sobre_indic_items[3]="DeMarker";
      sobre_indic_items[4]="Regressao linear";
      sobre_indic_items[5]="Desvio da media";
      sobre_indic_items[6]="MFI";
      sobre_indic_items[7]="Bears Power";
      sobre_indic_items[8]="Bulls Power";
      sobre_indic_items[9]="CCI";

      string sobre_entry_items[];
      ArrayResize(sobre_entry_items,3);
      sobre_entry_items[0]="Ao entrar";
      sobre_entry_items[1]="Ao sair";
      sobre_entry_items[2]="Estando";

      string sobre_sentido_items[];
      ArrayResize(sobre_sentido_items,2);
      sobre_sentido_items[0]="Sobrecompra compra";
      sobre_sentido_items[1]="Sobrecompra venda";

      y=10;
      if(!V2CreateFieldLabel(*m_host,m_sobre_indic_label,"Indicador",m_sobre_tabs,m_sobre_tabs,m_window_index,0,field_x,y,field_w,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_sobre_indic_combo,m_sobre_tabs,m_sobre_tabs,0,field_x,y,field_w,180,sobre_indic_items,0,card_border))
         return(false);
      y+=30;
      if(!V2CreateFieldLabel(*m_host,m_sobre_entry_label,"Entrada",m_sobre_tabs,m_sobre_tabs,m_window_index,0,field_x,y,field_w,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_sobre_entry_combo,m_sobre_tabs,m_sobre_tabs,0,field_x,y,field_w,90,sobre_entry_items,0,card_border))
         return(false);
      y+=30;
      if(!V2CreateFieldLabel(*m_host,m_sobre_sobrecompra_label,"Sobrecompra",m_sobre_tabs,m_sobre_tabs,m_window_index,0,field_x,y,field_w,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_sobre_sobrecompra_spin,m_sobre_tabs,m_sobre_tabs,0,field_x,y,field_w,100000.0,0.0,1.0,0,"2",sub_back,card_border))
         return(false);
      y+=30;
      if(!V2CreateFieldLabel(*m_host,m_sobre_sobrevenda_label,"Sobrevenda",m_sobre_tabs,m_sobre_tabs,m_window_index,0,field_x,y,field_w,16))
         return(false);
      y+=18;
      if(!CreateSpinControl(m_sobre_sobrevenda_spin,m_sobre_tabs,m_sobre_tabs,0,field_x,y,field_w,100000.0,-100000.0,1.0,0,"-2",sub_back,card_border))
         return(false);
      y+=30;
      if(!V2CreateFieldLabel(*m_host,m_sobre_sentido_label,"Sentido",m_sobre_tabs,m_sobre_tabs,m_window_index,0,field_x,y,field_w,16))
         return(false);
      y+=18;
      if(!CreateComboControl(m_sobre_sentido_combo,m_sobre_tabs,m_sobre_tabs,0,field_x,y,field_w,70,sobre_sentido_items,0,card_border))
         return(false);

      if(!m_host.CreateTextLabel(m_sobre_param_hint,"Os parametros detalhados por indicador vao entrar na proxima etapa desta migracao.",m_sobre_tabs,m_window_index,m_sobre_tabs,1,field_x,16,field_w,120))
         return(false);
      m_sobre_param_hint.FontSize(10);
      m_sobre_param_hint.LabelColor(V2_COLOR_TEXT_SECONDARY);

      m_sobre_tabs.SelectTab(0);
      m_sobre_tabs.ShowTabElements();

      m_created=true;
      return(true);
     }

   void OnTimerEvent(void)
     {
      SyncOrderTabChecks();
     }

   bool HandleEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      if(!m_created)
         return(false);
      if(id!=CHARTEVENT_CUSTOM+ON_CLICK_CHECKBOX)
         return(false);

      const int clicked_id=(int)lparam;
      if(m_ordem_market.Id()==clicked_id)
        {
         if(!m_ordem_market.IsPressed())
            m_ordem_market.IsPressed(true);
         m_ordem_limit.IsPressed(false);
         RefreshOrderChecks();
         return(true);
        }
      if(m_ordem_limit.Id()==clicked_id)
        {
         if(!m_ordem_limit.IsPressed())
            m_ordem_limit.IsPressed(true);
         m_ordem_market.IsPressed(false);
         RefreshOrderChecks();
         return(true);
        }
      if(m_ord_ref_check.Id()==clicked_id)
        {
         if(!m_ord_ref_check.IsPressed())
            m_ord_ref_check.IsPressed(true);
         m_ord_media_check.IsPressed(false);
         m_ord_tabs.SelectTab(0);
         m_ord_tabs.ShowTabElements();
         m_last_ord_tab=0;
         RefreshOrderChecks();
         return(true);
        }
      if(m_ord_media_check.Id()==clicked_id)
        {
         if(!m_ord_media_check.IsPressed())
            m_ord_media_check.IsPressed(true);
         m_ord_ref_check.IsPressed(false);
         m_ord_tabs.SelectTab(1);
         m_ord_tabs.ShowTabElements();
         m_last_ord_tab=1;
         RefreshOrderChecks();
         return(true);
        }
      if(m_canais_yes.Id()==clicked_id)
        {
         if(!m_canais_yes.IsPressed())
            m_canais_yes.IsPressed(true);
         m_canais_no.IsPressed(false);
         RefreshCanaisChecks();
         return(true);
        }
      if(m_canais_no.Id()==clicked_id)
        {
         if(!m_canais_no.IsPressed())
            m_canais_no.IsPressed(true);
         m_canais_yes.IsPressed(false);
         RefreshCanaisChecks();
         return(true);
        }
      return(false);
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_SINAIS_MAIN_VIEW_MQH__
