#ifndef __CONSTRUTOR_V2_TAB2_STOP_LOSS_MQH__
#define __CONSTRUTOR_V2_TAB2_STOP_LOSS_MQH__

class CTab2StopLoss : public CEF_CWndCreate
  {
private:
   SConstrutorSettings m_settings;
   bool              m_has_settings;
   bool              m_created;
   int               m_window_index;
   int               m_tab_index;

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

   int ClampIndex(const int value,const int min_value,const int max_value) const
     {
      if(value<min_value)
         return(min_value);
      if(value>max_value)
         return(max_value);
      return(value);
     }

   void StyleCombo(CEF_CComboBox &combo,const color border,const int width,const int list_height,const int button_width)
     {
      combo.XSize(width);
      combo.YSize(20);
      combo.BackColor(clrWhite);
      combo.BackColorHover(clrWhite);
      combo.BackColorPressed(clrWhite);
      combo.BorderColor(border);
      combo.BorderColorHover(border);
      combo.BorderColorPressed(border);
      combo.FontSize(10);
      combo.CheckBoxMode(false);
      combo.GetButtonPointer().XSize(button_width);
      combo.GetButtonPointer().XGap(1);
      combo.GetButtonPointer().YSize(20);
      combo.GetButtonPointer().AnchorRightWindowSide(false);
      combo.GetButtonPointer().BackColor(clrWhite);
      combo.GetButtonPointer().BackColorHover(clrWhite);
      combo.GetButtonPointer().BackColorPressed(clrWhite);
      combo.GetButtonPointer().BorderColor(border);
      combo.GetButtonPointer().BorderColorHover(border);
      combo.GetButtonPointer().BorderColorPressed(border);
      combo.GetButtonPointer().IconXGap(button_width-18);
      combo.GetButtonPointer().LabelXGap(10);
      combo.GetButtonPointer().LabelColor(C'43,43,43');
      combo.GetListViewPointer().YSize(list_height);
      combo.GetListViewPointer().LightsHover(true);
      combo.GetListViewPointer().BackColor(clrWhite);
     }

   void StyleSpin(CEF_CTextEdit &spin,const color back,const color border,const int width,const double max_value,const double min_value,const double step,const int digits,const string value)
     {
      spin.XSize(width);
      spin.MaxValue(max_value);
      spin.MinValue(min_value);
      spin.StepValue(step);
      spin.SetDigits(digits);
      spin.SpinEditMode(true);
      spin.CheckBoxMode(false);
      spin.SetValue(value);
      spin.GetTextBoxPointer().XSize(width-34);
      spin.GetTextBoxPointer().AutoSelectionMode(true);
      spin.GetTextBoxPointer().AnchorRightWindowSide(false);
      spin.GetTextBoxPointer().XGap(1);
      spin.BackColor(back);
      spin.BackColorHover(back);
      spin.BackColorPressed(back);
      spin.BorderColor(border);
      spin.BorderColorHover(border);
      spin.BorderColorPressed(border);
      spin.GetTextBoxPointer().BackColor(clrWhite);
      spin.GetTextBoxPointer().BackColorHover(clrWhite);
      spin.GetTextBoxPointer().BackColorPressed(clrWhite);
      spin.GetTextBoxPointer().BorderColor(border);
      spin.GetTextBoxPointer().BorderColorHover(border);
      spin.GetTextBoxPointer().BorderColorPressed(border);
      spin.GetIncButtonPointer().BackColor(clrWhite);
      spin.GetIncButtonPointer().BackColorHover(clrWhite);
      spin.GetIncButtonPointer().BackColorPressed(clrWhite);
      spin.GetIncButtonPointer().BorderColor(border);
      spin.GetIncButtonPointer().BorderColorHover(border);
      spin.GetIncButtonPointer().BorderColorPressed(border);
      spin.GetDecButtonPointer().BackColor(clrWhite);
      spin.GetDecButtonPointer().BackColorHover(clrWhite);
      spin.GetDecButtonPointer().BackColorPressed(clrWhite);
      spin.GetDecButtonPointer().BorderColor(border);
      spin.GetDecButtonPointer().BorderColorHover(border);
      spin.GetDecButtonPointer().BorderColorPressed(border);
     }

public:
                     CTab2StopLoss(void) : m_has_settings(false), m_created(false), m_window_index(-1), m_tab_index(-1) {}

   void SetSettings(const SConstrutorSettings &settings)
     {
      m_settings=settings;
      m_has_settings=true;
     }

   void ExportSettings(SConstrutorSettings &settings)
     {
      if(!m_has_settings)
         return;
      settings=m_settings;
     }

   bool Create(int window_index, CEF_CTabs &tabs, int tab_index)
     {
      if(m_created)
         return(true);

      m_window_index=window_index;
      m_tab_index=tab_index;

      const int tabs_w=tabs.XSize();
      const int content_pad=24;
      const int content_y=120;
      const int content_w=tabs_w-(content_pad*2);
      const int card_gap=12;
      const int card_w=(content_w-(card_gap*2))/3;
      const int tab2_x=content_pad;
      const int tab2_y=content_y;
      const int tab2_w=card_w;
      const int tab2_h=340;
      const color tab2_border=C'91,78,64';
      const color card_back=C'233,220,203';
      const color card_border=C'197,168,136';

      if(!CreateFrame(m_tab2_card_stopfix,"",tabs,m_window_index,tabs,m_tab_index,tab2_x,tab2_y,tab2_w,tab2_h,1))
         return(false);
      m_tab2_card_stopfix.BackColor(card_back);
      m_tab2_card_stopfix.BorderColor(card_border);

      if(!CreateTextLabel(m_tab2_card_title,"Stop loss (fixo)",m_tab2_card_stopfix,m_window_index,tabs,m_tab_index,16,12,tab2_w-32,22))
         return(false);
      m_tab2_card_title.FontSize(12);
      m_tab2_card_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab2_use_fixed,"Usar stop fixo",m_tab2_card_stopfix,m_window_index,tabs,m_tab_index,16,44,tab2_w-32,false,false,false))
         return(false);
      m_tab2_use_fixed.FontSize(10);
      m_tab2_use_fixed.LabelColor(C'43,43,43');

      const int tab2_calc_card_x=content_pad+card_w+card_gap;
      if(!CreateFrame(m_tab2_card_calc,"",tabs,m_window_index,tabs,m_tab_index,tab2_calc_card_x,tab2_y,tab2_w,tab2_h,1))
         return(false);
      m_tab2_card_calc.BackColor(card_back);
      m_tab2_card_calc.BorderColor(card_border);

      if(!CreateTextLabel(m_tab2_card_calc_title,"Stop loss (calculo)",m_tab2_card_calc,m_window_index,tabs,m_tab_index,16,12,tab2_w-32,22))
         return(false);
      m_tab2_card_calc_title.FontSize(12);
      m_tab2_card_calc_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab2_use_calc,"Usar calculo",m_tab2_card_calc,m_window_index,tabs,m_tab_index,16,34,tab2_w-32,false,false,false))
         return(false);
      m_tab2_use_calc.FontSize(10);
      m_tab2_use_calc.LabelColor(C'43,43,43');

      const int tab2_mult_card_x=content_pad+(card_w+card_gap)*2;
      if(!CreateFrame(m_tab2_card_mult,"",tabs,m_window_index,tabs,m_tab_index,tab2_mult_card_x,tab2_y,tab2_w,tab2_h,1))
         return(false);
      m_tab2_card_mult.BackColor(card_back);
      m_tab2_card_mult.BorderColor(card_border);

      if(!CreateTextLabel(m_tab2_card_mult_title,"Stop loss (multiplicador)",m_tab2_card_mult,m_window_index,tabs,m_tab_index,16,12,tab2_w-32,22))
         return(false);
      m_tab2_card_mult_title.FontSize(12);
      m_tab2_card_mult_title.LabelColor(C'43,43,43');

      if(!CreateCheckbox(m_tab2_use_mult,"Usar multiplicador",m_tab2_card_mult,m_window_index,tabs,m_tab_index,16,34,tab2_w-32,false,false,false))
         return(false);
      m_tab2_use_mult.FontSize(10);
      m_tab2_use_mult.LabelColor(C'43,43,43');

      const int mult_pad=16;
      const int mult_w=tab2_w-32;
      int mult_y=66;

      if(!CreateTextLabel(m_tab2_mult_base_label,"Base:",m_tab2_card_mult,m_window_index,tabs,m_tab_index,mult_pad,mult_y,mult_w,18))
         return(false);
      m_tab2_mult_base_label.FontSize(10);
      m_tab2_mult_base_label.LabelColor(C'91,78,64');
      mult_y+=22;

      string mult_base_items[];
      ArrayResize(mult_base_items,2);
      mult_base_items[0]="Corpo do candle";
      mult_base_items[1]="Range (pavio a pavio)";

      m_tab2_mult_base_combo.MainPointer(m_tab2_card_mult);
      tabs.AddToElementsArray(m_tab_index,m_tab2_mult_base_combo);
      m_tab2_mult_base_combo.ItemsTotal(ArraySize(mult_base_items));
      for(int i=0;i<ArraySize(mult_base_items);i++) m_tab2_mult_base_combo.SetValue(i,mult_base_items[i]);
      StyleCombo(m_tab2_mult_base_combo,tab2_border,mult_w,80,mult_w-2);
      if(!m_tab2_mult_base_combo.CreateComboBox("",mult_pad,mult_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_mult_base_combo);
      m_tab2_mult_base_combo.SelectItem(0);
      mult_y+=28;

      if(!CreateTextLabel(m_tab2_mult_candle_label,"Candle:",m_tab2_card_mult,m_window_index,tabs,m_tab_index,mult_pad,mult_y,mult_w,18))
         return(false);
      m_tab2_mult_candle_label.FontSize(10);
      m_tab2_mult_candle_label.LabelColor(C'91,78,64');
      mult_y+=22;

      string mult_candle_items[];
      ArrayResize(mult_candle_items,4);
      mult_candle_items[0]="Atual";
      mult_candle_items[1]="Ultimo";
      mult_candle_items[2]="Penultimo";
      mult_candle_items[3]="Antepenultimo";

      m_tab2_mult_candle_combo.MainPointer(m_tab2_card_mult);
      tabs.AddToElementsArray(m_tab_index,m_tab2_mult_candle_combo);
      m_tab2_mult_candle_combo.ItemsTotal(ArraySize(mult_candle_items));
      for(int j=0;j<ArraySize(mult_candle_items);j++) m_tab2_mult_candle_combo.SetValue(j,mult_candle_items[j]);
      StyleCombo(m_tab2_mult_candle_combo,tab2_border,mult_w,120,mult_w-2);
      if(!m_tab2_mult_candle_combo.CreateComboBox("",mult_pad,mult_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_mult_candle_combo);
      m_tab2_mult_candle_combo.SelectItem(0);
      mult_y+=28;

      if(!CreateTextLabel(m_tab2_mult_qty_label,"Multiplicador:",m_tab2_card_mult,m_window_index,tabs,m_tab_index,mult_pad,mult_y,mult_w,18))
         return(false);
      m_tab2_mult_qty_label.FontSize(10);
      m_tab2_mult_qty_label.LabelColor(C'91,78,64');
      mult_y+=22;

      m_tab2_mult_qty_spin.MainPointer(m_tab2_card_mult);
      tabs.AddToElementsArray(m_tab_index,m_tab2_mult_qty_spin);
      StyleSpin(m_tab2_mult_qty_spin,card_back,tab2_border,mult_w,1000.0,0.0,0.1,2,"1.0");
      if(!m_tab2_mult_qty_spin.CreateTextEdit("",mult_pad,mult_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_mult_qty_spin);

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
      tabs.AddToElementsArray(m_tab_index,m_tab2_calc_tabs);
      m_tab2_calc_tabs.XSize(calc_tabs_w);
      m_tab2_calc_tabs.YSize(calc_tabs_h);
      m_tab2_calc_tabs.IsCenterText(true);
      m_tab2_calc_tabs.PositionMode(TABS_TOP);
      m_tab2_calc_tabs.TabsYSize(calc_tab_h);
      m_tab2_calc_tabs.BackColorPressed(card_back);
      m_tab2_calc_tabs.BorderColor(card_border);
      m_tab2_calc_tabs.BorderColorHover(card_border);
      m_tab2_calc_tabs.BorderColorPressed(card_border);
      for(int k=0;k<3;k++)
         m_tab2_calc_tabs.AddTab(calc_tab_text[k],calc_tab_widths[k]);
      if(!m_tab2_calc_tabs.CreateTabs(calc_tabs_x,calc_tabs_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_calc_tabs);

      CEF_CButtonsGroup *calc_bg=m_tab2_calc_tabs.GetButtonsGroupPointer();
      if(calc_bg!=NULL)
        {
         for(int b=0;b<3;b++)
           {
            calc_bg.GetButtonPointer(b).FontSize(8);
            calc_bg.GetButtonPointer(b).BackColor(C'39,54,78');
            calc_bg.GetButtonPointer(b).BackColorHover(C'62,79,101');
            calc_bg.GetButtonPointer(b).BackColorPressed(C'226,114,64');
            calc_bg.GetButtonPointer(b).BorderColor(C'18,29,43');
            calc_bg.GetButtonPointer(b).BorderColorHover(C'62,79,101');
            calc_bg.GetButtonPointer(b).BorderColorPressed(C'240,140,86');
            calc_bg.GetButtonPointer(b).LabelColor(clrWhite);
            calc_bg.GetButtonPointer(b).LabelColorHover(clrWhite);
            calc_bg.GetButtonPointer(b).LabelColorPressed(clrWhite);
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

      const int subcard_x=calc_content_x;
      const int subcard_y=calc_content_y+18;
      const int subcard_w=calc_content_w;
      const int subcard_h=calc_tabs_h-subcard_y-10;
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

      const int fpad=12;
      const int f_w=subcard_w-(fpad*2);
      const int sub_label_h=16;
      const int sub_control_h=20;
      const int sub_vgap=8;
      const int sub_btn_w=f_w-2;
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
      m_tab2_calc_ref_base_combo.ItemsTotal(ArraySize(ref_items));
      for(int r=0;r<ArraySize(ref_items);r++) m_tab2_calc_ref_base_combo.SetValue(r,ref_items[r]);
      StyleCombo(m_tab2_calc_ref_base_combo,sub_border,f_w,120,sub_btn_w);
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
      candle_items[3]="Antepenultimo";

      m_tab2_calc_ref_candle_combo.MainPointer(m_tab2_calc_ref_card);
      m_tab2_calc_tabs.AddToElementsArray(0,m_tab2_calc_ref_candle_combo);
      m_tab2_calc_ref_candle_combo.ItemsTotal(ArraySize(candle_items));
      for(int c=0;c<ArraySize(candle_items);c++) m_tab2_calc_ref_candle_combo.SetValue(c,candle_items[c]);
      StyleCombo(m_tab2_calc_ref_candle_combo,sub_border,f_w,120,sub_btn_w);
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

      m_tab2_calc_ref_distance_spin.MainPointer(m_tab2_calc_ref_card);
      m_tab2_calc_tabs.AddToElementsArray(0,m_tab2_calc_ref_distance_spin);
      StyleSpin(m_tab2_calc_ref_distance_spin,sub_back,sub_border,f_w,100000.0,0.0,1.0,1,"0.0");
      if(!m_tab2_calc_ref_distance_spin.CreateTextEdit("",fpad,ry))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_calc_ref_distance_spin);
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
      m_tab2_calc_ref_expire_combo.ItemsTotal(ArraySize(expire_items));
      for(int e=0;e<ArraySize(expire_items);e++) m_tab2_calc_ref_expire_combo.SetValue(e,expire_items[e]);
      StyleCombo(m_tab2_calc_ref_expire_combo,sub_border,f_w,120,sub_btn_w);
      if(!m_tab2_calc_ref_expire_combo.CreateComboBox("",fpad,ry))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_calc_ref_expire_combo);
      m_tab2_calc_ref_expire_combo.SelectItem(0);

      int my=10;
      if(!CreateTextLabel(m_tab2_calc_media_candles_label,"Cand. media",m_tab2_calc_media_card,m_window_index,m_tab2_calc_tabs,1,fpad,my,f_w,sub_label_h))
         return(false);
      m_tab2_calc_media_candles_label.FontSize(9);
      m_tab2_calc_media_candles_label.LabelColor(C'91,78,64');
      my+=sub_label_h+2;

      m_tab2_calc_media_candles_spin.MainPointer(m_tab2_calc_media_card);
      m_tab2_calc_tabs.AddToElementsArray(1,m_tab2_calc_media_candles_spin);
      StyleSpin(m_tab2_calc_media_candles_spin,sub_back,sub_border,f_w,9999.0,1.0,1.0,0,"3");
      if(!m_tab2_calc_media_candles_spin.CreateTextEdit("",fpad,my))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_calc_media_candles_spin);
      my+=sub_control_h+sub_vgap;

      if(!CreateTextLabel(m_tab2_calc_media_base_label,"Referencia:",m_tab2_calc_media_card,m_window_index,m_tab2_calc_tabs,1,fpad,my,f_w,sub_label_h))
         return(false);
      m_tab2_calc_media_base_label.FontSize(9);
      m_tab2_calc_media_base_label.LabelColor(C'91,78,64');
      my+=sub_label_h+2;

      m_tab2_calc_media_base_combo.MainPointer(m_tab2_calc_media_card);
      m_tab2_calc_tabs.AddToElementsArray(1,m_tab2_calc_media_base_combo);
      m_tab2_calc_media_base_combo.ItemsTotal(ArraySize(ref_items));
      for(int mb=0;mb<ArraySize(ref_items);mb++) m_tab2_calc_media_base_combo.SetValue(mb,ref_items[mb]);
      StyleCombo(m_tab2_calc_media_base_combo,sub_border,f_w,120,sub_btn_w);
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
      StyleSpin(m_tab2_calc_media_distance_spin,sub_back,sub_border,f_w,100000.0,0.0,1.0,1,"0.0");
      if(!m_tab2_calc_media_distance_spin.CreateTextEdit("",fpad,my))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_calc_media_distance_spin);
      my+=sub_control_h+sub_vgap;

      if(!CreateTextLabel(m_tab2_calc_media_expire_label,"Expirar:",m_tab2_calc_media_card,m_window_index,m_tab2_calc_tabs,1,fpad,my,f_w,sub_label_h))
         return(false);
      m_tab2_calc_media_expire_label.FontSize(9);
      m_tab2_calc_media_expire_label.LabelColor(C'91,78,64');
      my+=sub_label_h+2;

      m_tab2_calc_media_expire_combo.MainPointer(m_tab2_calc_media_card);
      m_tab2_calc_tabs.AddToElementsArray(1,m_tab2_calc_media_expire_combo);
      m_tab2_calc_media_expire_combo.ItemsTotal(ArraySize(expire_items));
      for(int me=0;me<ArraySize(expire_items);me++) m_tab2_calc_media_expire_combo.SetValue(me,expire_items[me]);
      StyleCombo(m_tab2_calc_media_expire_combo,sub_border,f_w,120,sub_btn_w);
      if(!m_tab2_calc_media_expire_combo.CreateComboBox("",fpad,my))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_calc_media_expire_combo);
      m_tab2_calc_media_expire_combo.SelectItem(0);

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
      m_tab2_calc_maxmin_base_combo.ItemsTotal(ArraySize(maxmin_items));
      for(int mm=0;mm<ArraySize(maxmin_items);mm++) m_tab2_calc_maxmin_base_combo.SetValue(mm,maxmin_items[mm]);
      StyleCombo(m_tab2_calc_maxmin_base_combo,sub_border,f_w,80,sub_btn_w);
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
      StyleSpin(m_tab2_calc_maxmin_count_spin,sub_back,sub_border,f_w,9999.0,1.0,1.0,0,"3");
      if(!m_tab2_calc_maxmin_count_spin.CreateTextEdit("",fpad,maxmin_y))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_calc_maxmin_count_spin);

      if(!CreateTextLabel(m_tab2_calc_type_label,"Tipo de calculo",tabs,m_window_index,tabs,m_tab_index,content_pad,66,card_w,18))
         return(false);
      m_tab2_calc_type_label.FontSize(10);
      m_tab2_calc_type_label.LabelColor(C'91,78,64');

      string items_stop_calc[];
      ArrayResize(items_stop_calc,2);
      items_stop_calc[0]="Pontos";
      items_stop_calc[1]="Percentual";

      m_tab2_calc_type.MainPointer(tabs);
      tabs.AddToElementsArray(m_tab_index,m_tab2_calc_type);
      m_tab2_calc_type.ItemsTotal(ArraySize(items_stop_calc));
      for(int st=0;st<ArraySize(items_stop_calc);st++) m_tab2_calc_type.SetValue(st,items_stop_calc[st]);
      StyleCombo(m_tab2_calc_type,tab2_border,260,80,258);
      if(!m_tab2_calc_type.CreateComboBox("",content_pad,88))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_calc_type);
      m_tab2_calc_type.SelectItem(0);

      if(!CreateTextLabel(m_tab2_dist_label,"Stop distancia",m_tab2_card_stopfix,m_window_index,tabs,m_tab_index,16,76,tab2_w-32,18))
         return(false);
      m_tab2_dist_label.FontSize(10);
      m_tab2_dist_label.LabelColor(C'91,78,64');

      const int tab2_dist_w=tab2_w-32;
      m_tab2_dist_spin.MainPointer(m_tab2_card_stopfix);
      tabs.AddToElementsArray(m_tab_index,m_tab2_dist_spin);
      StyleSpin(m_tab2_dist_spin,card_back,tab2_border,tab2_dist_w,100000.0,0.0,1.0,1,"100.0");
      if(!m_tab2_dist_spin.CreateTextEdit("",16,98))
         return(false);
      AddToElementsArray(m_window_index,m_tab2_dist_spin);

      m_tab2_calc_tabs.SelectTab(0);
      m_tab2_calc_tabs.ShowTabElements();
      m_created=true;
      return(true);
     }

   void Load()
     {
      if(!m_has_settings || !m_created)
         return;

      const bool use_calc=(m_settings.stop_calculo==CONSTRUTOR_SIM);
      const bool use_mult=(!use_calc && m_settings.stop_calculo_multiplicar==CONSTRUTOR_SIM);
      const bool use_fixed=(!use_calc && !use_mult && m_settings.stop_fixo==CONSTRUTOR_SIM);
      m_tab2_use_calc.IsPressed(use_calc);
      m_tab2_use_fixed.IsPressed(use_fixed);
      m_tab2_use_mult.IsPressed(use_mult);
      m_tab2_calc_type.SelectItem(ClampIndex((int)m_settings.tipo_stop_loss,0,1));
      m_tab2_dist_spin.SetValue(DoubleToString(m_settings.stop_fixo_distancia,1));
      m_tab2_calc_ref_check.IsPressed(m_settings.stop_calculo_referencia==CONSTRUTOR_SIM);
      m_tab2_calc_media_check.IsPressed(m_settings.stop_calculo_media==CONSTRUTOR_SIM);
      m_tab2_calc_maxmin_check.IsPressed(m_settings.stop_calculo_maxmin==CONSTRUTOR_SIM);
      m_tab2_calc_maxmin_base_combo.SelectItem(ClampIndex((int)m_settings.stop_calculo_maxmin_base,0,3));
      m_tab2_calc_maxmin_count_spin.SetValue(IntegerToString(m_settings.stop_calculo_maxmin_ultimos>0 ? m_settings.stop_calculo_maxmin_ultimos : 3));
      m_tab2_calc_ref_base_combo.SelectItem(ClampIndex((int)m_settings.stop_calculo_referencia_base,0,3));
      m_tab2_calc_ref_candle_combo.SelectItem(ClampIndex((int)m_settings.stop_calculo_referencia_posicao,0,3));
      m_tab2_calc_ref_distance_spin.SetValue(DoubleToString(m_settings.stop_calculo_referencia_distancia,1));
      m_tab2_calc_ref_expire_combo.SelectItem(ClampIndex(m_settings.stop_calculo_referencia_expirar,0,4));
      m_tab2_calc_media_candles_spin.SetValue(IntegerToString(m_settings.stop_calculo_media_qtd_candles));
      m_tab2_calc_media_base_combo.SelectItem(ClampIndex((int)m_settings.stop_calculo_media_base,0,3));
      m_tab2_calc_media_distance_spin.SetValue(DoubleToString(m_settings.stop_calculo_media_distancia,1));
      m_tab2_calc_media_expire_combo.SelectItem(ClampIndex(m_settings.stop_calculo_media_expirar,0,4));
      m_tab2_mult_base_combo.SelectItem(ClampIndex((int)m_settings.stop_calculo_multiplicar_base,0,1));
      m_tab2_mult_candle_combo.SelectItem(ClampIndex(m_settings.stop_calculo_multiplicar_candle,0,3));
      m_tab2_mult_qty_spin.SetValue(DoubleToString(m_settings.stop_calculo_multiplicar_qtd,2));
     }

   void Save()
     {
      if(!m_has_settings || !m_created)
         return;

      const bool use_calc=m_tab2_use_calc.IsPressed();
      const bool use_mult=(!use_calc && m_tab2_use_mult.IsPressed());
      const bool use_fixed=(!use_calc && !use_mult && m_tab2_use_fixed.IsPressed());
      m_settings.usar_stop_loss=((use_calc || use_mult || use_fixed) ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.stop_calculo=(use_calc ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.stop_calculo_multiplicar=(use_mult ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.stop_fixo=(use_fixed ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.tipo_stop_loss=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)ClampIndex(m_tab2_calc_type.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.stop_fixo_distancia=StringToDouble(m_tab2_dist_spin.GetValue());
      m_settings.stop_calculo_referencia=(m_tab2_calc_ref_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.stop_calculo_media=(m_tab2_calc_media_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.stop_calculo_maxmin=(m_tab2_calc_maxmin_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.stop_calculo_maxmin_base=(ENUM_CONSTRUTOR_BASE_MEDIA)ClampIndex(m_tab2_calc_maxmin_base_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.stop_calculo_maxmin_ultimos=(int)StringToInteger(m_tab2_calc_maxmin_count_spin.GetValue());
      m_settings.stop_calculo_referencia_base=(ENUM_CONSTRUTOR_BASE_MEDIA)ClampIndex(m_tab2_calc_ref_base_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.stop_calculo_referencia_posicao=(ENUM_CONSTRUTOR_POSICAO_REFERENCIA)ClampIndex(m_tab2_calc_ref_candle_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.stop_calculo_media_qtd_candles=(int)StringToInteger(m_tab2_calc_media_candles_spin.GetValue());
      m_settings.stop_calculo_media_base=(ENUM_CONSTRUTOR_BASE_MEDIA)ClampIndex(m_tab2_calc_media_base_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.stop_calculo_referencia_distancia=StringToDouble(m_tab2_calc_ref_distance_spin.GetValue());
      m_settings.stop_calculo_referencia_expirar=ClampIndex(m_tab2_calc_ref_expire_combo.GetListViewPointer().SelectedItemIndex(),0,4);
      m_settings.stop_calculo_media_distancia=StringToDouble(m_tab2_calc_media_distance_spin.GetValue());
      m_settings.stop_calculo_media_expirar=ClampIndex(m_tab2_calc_media_expire_combo.GetListViewPointer().SelectedItemIndex(),0,4);
      m_settings.stop_calculo_multiplicar_base=(ENUM_CONSTRUTOR_BASE_MULTIPLICAR)ClampIndex(m_tab2_mult_base_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.stop_calculo_multiplicar_candle=ClampIndex(m_tab2_mult_candle_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.stop_calculo_multiplicar_qtd=StringToDouble(m_tab2_mult_qty_spin.GetValue());
     }

   bool HandleEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      if(!m_created)
         return(false);
      if(id!=CHARTEVENT_CUSTOM+ON_CLICK_CHECKBOX)
         return(false);

      const int clicked_id=(int)lparam;
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
         return(true);
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
         return(true);
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
         return(true);
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
         return(true);
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
         return(true);
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
         return(true);
        }
      return(false);
     }
  };

#endif // __CONSTRUTOR_V2_TAB2_STOP_LOSS_MQH__
