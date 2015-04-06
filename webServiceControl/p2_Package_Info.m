//
//  packInfo.m
//  myPota
//
//  Created by Rodrigo Pimentel on 27/10/14.
//  Copyright (c) 2014 web. All rights reserved.
//

#import "p2_Package_Info.h"

@implementation p2_Package_Info

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"packCircuits contem Warnings");
}

#pragma mark - configNavBar
- (void)configNavBar
{
    NSAttributedString *title = [[NSAttributedString alloc]initWithString:@"Detalhamento do Pacote"
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:FONT_NAME_BOLD size:18]}];
    [AppFunctions CONFIGURE_NAVIGATION_BAR:self
                                     image:IMAGE_NAVIGATION_BAR_GENERIC
                                     title:title
                                 backLabel:NAVIGATION_BAR_BACK_TITLE_CLEAR
                                buttonBack:@selector(btnBackScreen:)
                             openSplitMenu:@selector(menuOpen:)
                                backButton:YES];
}

- (IBAction)menuOpen:(id)sender
{
    [AppMenuView openMenu:self
                   sender:sender];
}

- (IBAction)btnBackScreen:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - configCabeçalho
- (void)configHeader
{
    [tableViewData setBackgroundColor:[UIColor clearColor]];
    seller = [AppFunctions PLIST_LOAD:PLIST_SELLER_NAME];
    for (NSDictionary *info in [[AppFunctions DATA_BASE_ENTITY_LOAD:TAG_USER_AGENCY] objectForKey:TAG_USER_AGENCY_LIST_ID_WS])
        if ([[info objectForKey:TAG_USER_AGENCY_CODE_SITE] isEqualToString:@"4"])
            IDWS = [info objectForKey:@"idWsSite"];
    if (IDWS == nil)
        IDWS = KEY_ID_WS_TRAVEL;
    
    listData = [[NSMutableDictionary alloc]initWithDictionary:[AppFunctions LOAD_INFORMATION:PACKAGE_INFO_DATA]];
    
    infoType    = [[listData objectForKey:PACKAGE_INFO_TYPE] copy];
    infoCircuit = [[listData objectForKey:PACKAGE_INFO_CIRCUIT] mutableCopy];
}

#pragma mark - configLinks
- (void)configLinks
{
    linkCitysInclude = [NSString stringWithFormat:WS_URL_INFO_CIRCUITS_ALL_CITYS_INFO,IDWS, @"4", [infoCircuit objectForKey:TAG_PACK_CIRCUIT_COD_PRODUCT],
                        [infoCircuit objectForKey:TAG_PACK_CIRCUIT_TYPE_PRODUCT]];
    linkCitysInclude = [NSString stringWithFormat:WS_URL, WS_URL_INFO_CIRCUITS_ALL_CITYS, linkCitysInclude];
    linkGeneralConditions = [NSString stringWithFormat:WS_URL_INFO_CIRCUITS_ALL_CONDICTION_INFO,IDWS, @"4", [infoCircuit objectForKey:TAG_PACK_CIRCUIT_COD_PRODUCT],
                             [infoType objectForKey:TAG_PACK_COD_PORTAL]];
    linkGeneralConditions = [NSString stringWithFormat:WS_URL, WS_URL_INFO_CIRCUITS_ALL_CONDICTION, linkGeneralConditions];
    linkImagesCircuits = [NSString stringWithFormat:WS_URL_INFO_CIRCUITS_ALL_IMAGES_INFO, IDWS, @"4", [infoCircuit objectForKey:TAG_PACK_CIRCUIT_COD_PRODUCT],
                          [infoCircuit objectForKey:TAG_PACK_CIRCUIT_TYPE_PRODUCT]];
    linkImagesCircuits = [NSString stringWithFormat:WS_URL, WS_URL_INFO_CIRCUITS_ALL_IMAGES, linkImagesCircuits];
    linkDayForDay = [NSString stringWithFormat:WS_URL_INFO_CIRCUITS_ALL_DAY_INFO, IDWS,@"4", [infoCircuit objectForKey:TAG_PACK_CIRCUIT_COD_PRODUCT],
                     [infoCircuit objectForKey:TAG_PACK_CIRCUIT_DATE_PRODUTO]];
    linkDayForDay = [NSString stringWithFormat:WS_URL, WS_URL_INFO_CIRCUITS_ALL_DAY, linkDayForDay];
    
    linkIsInclude = [NSString stringWithFormat:WS_URL_INFO_CIRCUITS_ALL_INCLUDE_INFO,IDWS, @"4", [infoCircuit objectForKey:TAG_PACK_CIRCUIT_COD_PRODUCT],
                     [infoCircuit objectForKey:TAG_PACK_CIRCUIT_DATE_PRODUTO]];
    linkIsInclude = [NSString stringWithFormat:WS_URL, WS_URL_INFO_CIRCUITS_ALL_INCLUDE, linkIsInclude];
    
    
    linkDataCircuts =[NSString stringWithFormat:WS_URL_PACK_DATA_INFO,IDWS, @"4", [infoCircuit objectForKey:TAG_PACK_CIRCUIT_COD_PRODUCT]];
    linkDataCircuts = [NSString stringWithFormat:WS_URL, WS_URL_PACK_DATA, linkDataCircuts];
}

#pragma mark - configButtons
- (void)configButtons
{
    [tableViewData setBackgroundColor:[UIColor clearColor]];
    [tableViewData setSeparatorColor:[UIColor clearColor]];
    
//    titles = @[@"Condições Gerais",
//               @"Informações Sobre o Roteiro",
//               @"Dia a Dia"];
    titles = @[@"Informações Sobre o Roteiro"];
}

#pragma mark - configRoons
- (void)configData
{
    infoData = [@{ PACKAGE_INFO_DATA_SEARCH_COD_PLAN 			: @"",
                   PACKAGE_INFO_DATA_SEARCH_COD_TEMP 			: @"",
                   PACKAGE_INFO_DATA_SEARCH_COD_TYPE_TEMP 		: @"",
                   PACKAGE_INFO_DATA_SEARCH_IND_AERO            : @"",
                   PACKAGE_INFO_DATA_SEARCH_COD_PLAN_AERO		: @"",
                   PACKAGE_INFO_DATA_SEARCH_DATA_ORIGINAL	  	: @"",
                   PACKAGE_INFO_DATA_SEARCH_DATA_FORMATED	 	: @"",
                   PACKAGE_INFO_DATA_SEARCH_DATA_AERO			: @"",
                   PACKAGE_INFO_DATA_SEARCH_COD_TYPE_CIRCUIT    : @"",
                   PACKAGE_INFO_DATA_SEARCH_DATA_FORMATED_WS    : @"",
                   PACKAGE_INFO_DATA_SEARCH_DSC_TYPE_TEMP	 	: @"",
                   PACKAGE_INFO_DATA_SEARCH_IND_PER_SOL_RES     : @"",
                   PACKAGE_INFO_DATA_SEARCH_COMB_OPT_SELLING 	: @"",
                   PACKAGE_INFO_DATA_SEARCH_DATA_EXTENCE        : @"",
                   PACKAGE_INFO_DATA_SEARCH_DATA_EXTENCE_AERO	: @"",
                   PACKAGE_INFO_DATA_SEARCH_MONTH_AJUST         : @"",
                   PACKAGE_INFO_DATA_SEARCH_YEAR_AJUST          : @"",
                   PACKAGE_INFO_DATA_SEARCH_MONTH_ORG           : @"",
                   PACKAGE_INFO_DATA_SEARCH_YEAR_ORG            : @"",
                   PACKAGE_INFO_DATA_SEARCH_TYPE_PRODUCT        : @"",
                   PACKAGE_INFO_DATA_SEARCH_TYPE_ROTEIRO        : @"",
                   PACKAGE_INFO_DATA_SEARCH_QUANT_DISP          : @"",
                   PACKAGE_INFO_DATA_SEARCH_QUANT_DISP_AERO     : @"",
                   PACKAGE_INFO_DATA_SEARCH_QUANT_DISP_CRUZERO  : @"",
                   PACKAGE_INFO_DATA_SEARCH_DATA_ATIVA          : @"",
                   PACKAGE_INFO_DATA_SEARCH_DATA_ATIVA_AERO     : @"",
                   PACKAGE_INFO_DATA_SEARCH_TYPE_AERO		 	: @""}mutableCopy];
    
    
    [infoCircuit setValue:@"0" forKey:TAG_PACK_CIRCUIT_VALUE_VENDA];
    
    roons    = [@[]mutableCopy];
    valuePurchase = [NSString stringWithFormat:@"%.2f",
                     [[infoCircuit objectForKey:TAG_PACK_CIRCUIT_VALUE_VENDA]floatValue]];
    
    cellPriceSize = 158;
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.dimBackground = YES;
    HUD.delegate      = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configHeader];
    [self configLinks];
    [self configButtons];
    [self configData];
}

#pragma mark - willAppear
- (void)viewWillAppear:(BOOL)animated
{
    [self configNavBar];
    [tableViewData reloadData];
    [super viewWillAppear:animated];
}

- (NSString *)getNextLink{
    return nextLink;
}

#pragma mark - table view Data
#pragma mark - Number of Sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

#pragma mark - Number of Lines
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return 1;
    else if (section == 1)
        return [titles count];
    else if (section == 2)
        return 1;
    else if (section == 3)
        return [roons count];
    else if (section == 4)
        return 1;
    else if (section == 5)
        return 1;
    else
        return 0;
}

#pragma mark - Title Sections Heigth Header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section <= 2 )
        return 0.001;
    return 1;
}

#pragma mark - Title Sections Heigth Foter
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section <= 3)
        return 0.001;
    return 5;
}

#pragma mark - Cell Size
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0) {
        return 278;
    } else if ([indexPath section] == 1) {
        return 50;
    } else if ([indexPath section] == 2) {
        if ([roons count] > 0)
            return 82;
        else
            return 48;
    } else if ([indexPath section] == 3) {
        return 60;
    } else if ([indexPath section] == 4) {
        return cellPriceSize;
    } else
        return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0)
        return [self setSection0:tableView index:indexPath];
    else if ([indexPath section] == 1)
        return [self setSection1:tableView index:indexPath];
    else if ([indexPath section] == 2)
        return [self setSection2:tableView index:indexPath];
    else if ([indexPath section] == 3)
        return [self setSection3:tableView index:indexPath];
    else if ([indexPath section] == 4)
        return [self setSection4:tableView index:indexPath];
    else if ([indexPath section] == 5)
        return [self setSection5:tableView index:indexPath];
    else
        return nil;
}

#pragma mark - Cell config sector 0
- (UITableViewCell *)setSection0:(UITableView *)tableView index:(NSIndexPath *)indexPath
{
    p2_Package_Info_Cell_Header *cell = [tableView dequeueReusableCellWithIdentifier:@"CellHeader" forIndexPath:indexPath];
    
    
    NSString *link = [infoCircuit objectForKey:TAG_PACK_CIRCUIT_IMAGE_PRODUTO];
    if (![link containsString:@"www"]){
        link = [NSString stringWithFormat:@"%@%@",@"http://www.schultz.com.br/arquivos/img/roteiro/",
                [infoCircuit objectForKey:TAG_PACK_CIRCUIT_IMAGE_PRODUTO]];
        
        [AppFunctions LOAD_IMAGE_ASYNC:link completion:^(UIImage *image) {
            [cell.btnImage setImage:image forState:UIControlStateNormal];
        }];
    }
    
    NSString *circuit_type = [infoCircuit objectForKey:TAG_PACK_CIRCUIT_TYPE_ROTEIRO];
    [cell.lblCircuitType setText:[NSString stringWithFormat:@"Roteiro: %@", circuit_type]];
    
    NSString *circuit_days = [infoCircuit objectForKey:TAG_PACK_CIRCUIT_NUM_DAYS];
    NSString *day   = @"Dias";
    if ([circuit_days integerValue] <= 1) day = @"Dia";
    circuit_days = [NSString stringWithFormat:@"%@ %@", circuit_days, day];
    
    
    NSString *circuit_name = [infoCircuit objectForKey:TAG_PACK_CIRCUIT_NAME_PRODUCT];
    circuitName = circuit_name;
    
    [cell.lblCircuitName setText:[NSString stringWithFormat:@"%@ (%@)",circuitName, circuit_days]];
    [cell.lblCircuitName setAdjustsFontSizeToFitWidth:YES];
    
    circuitName = cell.lblCircuitName.text;
    
    NSString *circuit_info = [infoCircuit objectForKey:TAG_PACK_CIRCUIT_NAME_COUNTRY];
    [cell.lblCircuitInfo setText:circuit_info];
    [cell.lblCircuitInfo setAdjustsFontSizeToFitWidth:YES];
    
    [cell.btnImage addTarget:self
                      action:@selector(btnCircuitImages:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [cell.btnCircuits addTarget:self
                         action:@selector(btnCircuitCitys:)
               forControlEvents:UIControlEventTouchUpInside];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

#pragma mark - buttons header
- (IBAction)btnCircuitImages:(id)sender {
    nextLink = linkImagesCircuits;
    [AppFunctions GO_TO_SCREEN:self destiny:SEGUE_P2_TO_P5];
}

- (IBAction)btnCircuitCitys:(id)sender {
    nextLink = linkCitysInclude;
    //    [AppFunctions GO_TO_SCREEN:self destiny:SEGUE_P2_TO_P3];
}

#pragma mark - Cell config sector 1
- (UITableViewCell *)setSection1:(UITableView *)tableView index:(NSIndexPath *)indexPath
{
    p2_Package_Info_Cell_Button *cell = [tableView dequeueReusableCellWithIdentifier:@"CellInfo" forIndexPath:indexPath];
    
//    if([indexPath row] != 2)
//        [cell.imgBar    setHidden:YES];
//    if([indexPath row] == 2)
        [cell.imgDotBar setHidden:YES];
    
    [cell.lblTitle setText:[titles objectAtIndex:[indexPath row]]];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.tag = [indexPath row];
    
    return cell;
}

#pragma mark - Cell config sector 2
- (UITableViewCell *)setSection2:(UITableView *)tableView index:(NSIndexPath *)indexPath
{
    p2_Package_Info_Cell_Data *cell = [tableView dequeueReusableCellWithIdentifier:@"CellData" forIndexPath:indexPath];
    
    [AppFunctions TABLE_CELL_NO_TOUCH_DELAY:cell];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.tag = [indexPath row];
    
    [cell.btnSetData addTarget:self
                        action:@selector(btnSetData:)
              forControlEvents:UIControlEventTouchUpInside];
    
    if (![[infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_DATA_FORMATED] isEqualToString:@""])
        [cell.btnSetData setTitle:[NSString stringWithFormat:@"%@ - (%@) - %@ vagas",
                                   [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_DATA_FORMATED],
                                   [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_TYPE_ROTEIRO],
                                   [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_QUANT_DISP]]
                         forState:UIControlStateNormal];
    
    //
    //    if (![[infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_DATA_FORMATED] isEqualToString:@""])
    //        [cell.lblData setText:[NSString stringWithFormat:@"%@ - (%@) - %@ vagas",
    //                               [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_DATA_FORMATED],
    //                               [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_TYPE_ROTEIRO],
    //                               [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_QUANT_DISP]]];
    return cell;
}

#pragma mark - Button Data
- (IBAction)btnSetData:(UIButton *)sender
{
    nextLink = linkDataCircuts;
    [AppFunctions GO_TO_SCREEN:self destiny:SEGUE_P2_TO_P4];
}

#pragma mark - setData
- (void)setInfoData:(NSMutableDictionary *)info
{
    infoData = [info mutableCopy];
    [roons removeAllObjects];
    [tableViewData reloadData];
    [self setInfoRoons];
}

#pragma mark - searchRoons
- (void)setInfoRoons
{
    linkRoomCircuts =[NSString stringWithFormat:WS_URL_PACK_ROOM_INFO,IDWS, @"4",
                      [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_COD_PLAN],
                      [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_DATA_FORMATED],
                      [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_COD_TEMP],
                      [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_COD_TYPE_TEMP],
                      [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_TYPE_PRODUCT],
                      [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_IND_AERO],
                      [infoData objectForKey:PACKAGE_INFO_DATA_SEARCH_COD_PLAN_AERO]
                      ];
    linkRoomCircuts = [NSString stringWithFormat:WS_URL, WS_URL_PACK_ROOM, linkRoomCircuts];
    
    [HUD show:YES];
    HUD.labelText = @"Verificando os quartos disponíveis.";
    
    [appConnection START_CONNECT:linkRoomCircuts timeForOu:15.F labelConnection:nil showView:NO block:^(NSData *result) {
        if (result == nil){
            [self setInfoRoons];
        }else {
            NSString *tag = @"acomodacao";
            NSDictionary *allPlans = (NSDictionary *)[[AzParser alloc] xmlDictionary:result tagNode:tag];
            for (NSDictionary *tmp in [allPlans objectForKey:tag]) {
                NSDictionary *roomData = @{
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_ABR_COIN               : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_ABR_COIN],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DAYS_LAST_AERO         : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DAYS_LAST_AERO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DAYS_POST_AERO         : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DAYS_POST_AERO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA               : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_AERO          : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_AERO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_CRUZ          : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_CRUZ],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_PRAZO         : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_PRAZO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_PRAZO_AERO    : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_PRAZO_AERO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_PRAZO_CRUZ    : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TAXA_PRAZO_CRUZ],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TYPE_ACOMODATION   : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TYPE_ACOMODATION],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_VALUE_PLAN         : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_VALUE_PLAN],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_IND_COMPAR             : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_IND_COMPAR],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_IND_PACKAGE            : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_IND_PACKAGE],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_NIGHT_END              : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_NIGHT_END],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_NIGHT_START            : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_NIGHT_START],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_ORD_PRODUCT            : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_ORD_PRODUCT],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_QTD_NIGHT_EXTRA_END    : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_QTD_NIGHT_EXTRA_END],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_QTD_NIGHT_EXTRA_START  : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_QTD_NIGHT_EXTRA_START],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_QTD_PEOPLE             : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_QTD_PEOPLE],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_SEQ_VALUE_PLAN         : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_SEQ_VALUE_PLAN],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_SGL_ACOMODATION        : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_SGL_ACOMODATION],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_SGL_COIN               : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_SGL_COIN],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_TOT_TAXA               : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_TOT_TAXA],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_TYPE_AERO              : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_TYPE_AERO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_TYPE_PRODUCT           : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_TYPE_PRODUCT],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_TYPE_ROTEIRO           : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_TYPE_ROTEIRO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_AERO             : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_AERO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_CRUZ             : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_CRUZ],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA             : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_AERO        : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_AERO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_CRUZ        : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_CRUZ],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_PRAZO       : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_PRAZO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_PRAZO_AERO  : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_PRAZO_AERO],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_PRAZO_CRUZ  : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_TAXA_PRAZO_CRUZ],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_VALUE_VENDA      : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_VALUE_VENDA],
                                           PACKAGE_INFO_DATA_SEARCH_ROOM_NAME_HOTEL             : [tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_NAME_HOTEL],
                                           PACKAGE_INFO_ROOM_NUMBER                             : @"0"
                                           };
                
                [roons addObject:[roomData mutableCopy]];
                
                valuePurchase = [NSString stringWithFormat:@"%.2f",
                                 [[infoCircuit objectForKey:TAG_PACK_CIRCUIT_VALUE_VENDA]floatValue]];
                
                [tableViewData reloadData];
                [HUD hide:YES];
            }
        }
    }];
}

#pragma mark - Cell config sector 3
- (UITableViewCell *)setSection3:(UITableView *)tableView index:(NSIndexPath *)indexPath
{
    p2_Package_Info_Cell_Room_Travel *cell = [tableView dequeueReusableCellWithIdentifier:@"CellRoom" forIndexPath:indexPath];
    
    [AppFunctions TABLE_CELL_NO_TOUCH_DELAY:cell];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.tag = [indexPath row];
    
    [cell.imgType   setImage:[UIImage imageNamed:[[roons objectAtIndex:[indexPath row]]objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TYPE_ACOMODATION]]];
    [cell.lblType   setText: [[roons objectAtIndex:[indexPath row]]
                              objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_DSC_TYPE_ACOMODATION]];
    [cell.lblNumber setText: [[roons objectAtIndex:[indexPath row]]objectForKey:PACKAGE_INFO_ROOM_NUMBER]];
    [cell.lblPrice  setText: [NSString stringWithFormat:@"%@ %.2f",
                              [[roons objectAtIndex:[indexPath row]]
                               objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_ABR_COIN],
                              [[[roons objectAtIndex:[indexPath row]]
                                objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_VALUE_VENDA] floatValue]]];
    [cell.lblName setText:[[roons objectAtIndex:[indexPath row]]
                           objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_NAME_HOTEL]];
    [cell.lblName setAdjustsFontSizeToFitWidth:YES];
    cell.stepper.tag = [indexPath row];
    float scale = .7f;
    cell.stepper.transform = CGAffineTransformMakeScale(scale, scale);
    cell.stepper.value = [[[roons objectAtIndex:[indexPath row]] objectForKey:PACKAGE_INFO_ROOM_NUMBER] intValue];
    
    [cell.stepper addTarget:self
                     action:@selector(btnStepper:)
           forControlEvents:UIControlEventTouchUpInside];
    
    if([indexPath row] == 3)[cell.ditLine setHidden:YES];
    if([indexPath row] != 3)[cell.endLine setHidden:YES];
    
    return cell;
}

#pragma mark - Button Parcel
- (IBAction)btnStepper:(UIStepper *)sender
{
    [[roons objectAtIndex:sender.tag]setObject:[NSString stringWithFormat:@"%d",(int)sender.value] forKey:PACKAGE_INFO_ROOM_NUMBER];
    [self setMoney];
}

- (void)setMoney
{
    valuePurchase = [NSString stringWithFormat:@"%.2f",
                     [[infoCircuit objectForKey:TAG_PACK_CIRCUIT_VALUE_VENDA]floatValue]];
    for (NSDictionary *room in roons)
    {
        float money = [valuePurchase floatValue] + ([[room objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_VALUE_VALUE_VENDA]floatValue] * [[room objectForKey:PACKAGE_INFO_ROOM_NUMBER]intValue] * [[room objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_QTD_PEOPLE]intValue]);
        valuePurchase = [NSString stringWithFormat:@"%.2f",money];
    }
    
    [tableViewData reloadData];
}

#pragma mark - Cell config sector 4
- (UITableViewCell *)setSection4:(UITableView *)tableView index:(NSIndexPath *)indexPath
{
    p2_Package_Info_Cell_Price *cell = [tableView dequeueReusableCellWithIdentifier:@"CellCustos" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    [cell.lblTitle setText:circuitName];
    
    [cell.lblPrice setText:[NSString stringWithFormat:@"%@ %.2f",
                            [infoCircuit objectForKey:TAG_PACK_CIRCUIT_COIN],
                            [valuePurchase floatValue]]];
    
    [cell start];
    
    cellPriceSize = SIZE_START;
    
    int extraLine = 0;
    for (NSDictionary *room in roons)
        if ([[room objectForKey:PACKAGE_INFO_ROOM_NUMBER]intValue] != 0)
            extraLine += 1;
    
    cellPriceSize = cellPriceSize + (SIZE_PLUS * extraLine);
    [cell rezise:extraLine roons:roons coin:[infoCircuit objectForKey:TAG_PACK_CIRCUIT_COIN]];
    
    return cell;
}

#pragma mark - Cell config sector 5
- (UITableViewCell *)setSection5:(UITableView *)tableView index:(NSIndexPath *)indexPath
{
    p2_Package_Info_Cell_Confirm *cell = [tableView dequeueReusableCellWithIdentifier:@"CellConfirm" forIndexPath:indexPath];
    [AppFunctions TABLE_CELL_NO_TOUCH_DELAY:cell];
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell.btnConfirm addTarget:self action:@selector(btnConfirm:)
              forControlEvents:UIControlEventTouchUpInside];
    [cell.btnMail addTarget:self action:@selector(btnMail:)
           forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 1){
        selected = [titles objectAtIndex:[indexPath row]];
        [AppFunctions GO_TO_SCREEN:self destiny:SEGUE_P2_TO_P3];
    }
}

- (NSString *)getSelected
{
    return selected;
}

- (NSString *)getSelectedLink:(int)type
{
    if (type == 1)
        return linkIsInclude;
    else if (type == 2)
        return linkDayForDay;
    else
        return linkGeneralConditions;
}

#pragma mark - Button confirm to Next Screen
- (IBAction)btnConfirm:(UIButton *)sender
{
    if ([[infoData objectForKey:@"DtaExtenso"] isEqualToString:@""]) {
        [AppFunctions LOG_MESSAGE:@"Nenhuma data foi escolhida."
                          message:@"Para continuar, escolha uma data."
                           cancel:ERROR_BUTTON_CANCEL];
        return;
    }
    
    
    if ([valuePurchase isEqualToString:@"0.00"] ) {
        [AppFunctions LOG_MESSAGE:@"Nenhum quarto foi selecionado."
                          message:@"Para continuar, selecione pelo menos 1 quarto."
                           cancel:ERROR_BUTTON_CANCEL];
        return;
    }
    
    NSMutableArray *selectRoons = [NSMutableArray new];
    int pax = 0;
    for (NSDictionary *tmp in roons) {
        if ([[tmp objectForKey:PACKAGE_INFO_ROOM_NUMBER]intValue] > 0) {
            pax += [[tmp objectForKey:PACKAGE_INFO_DATA_SEARCH_ROOM_QTD_PEOPLE]intValue] * [[tmp objectForKey:PACKAGE_INFO_ROOM_NUMBER]intValue];
            [selectRoons addObject:tmp];
        }
    }
    
    NSString *paxNumber = [NSString stringWithFormat:@"%d", pax];
    purchaseData = [ @{ PURCHASE_INFO_PRODUCT : @{ PURCHASE_DATA_TRAVEL_PAX : paxNumber,
                                                   @"info_data"       : infoData,
                                                   @"info_room"       : selectRoons,
                                                   @"info_circuit"    : infoCircuit,
                                                   @"link_cyties"     : linkCitysInclude,
                                                   @"link_days"       : linkDayForDay,
                                                   @"link_info"       : linkIsInclude,
                                                   @"link_conditions" : linkGeneralConditions,
                                                   @"link_images"     : linkImagesCircuits
                                                   },
                        @"type"               : PURCHASE_TYPE_PACKGE
                        }mutableCopy];
    
    HUD.labelText = @"Carregando Dados.";
    [HUD show:YES];
    [self loadContract];
}

#pragma mark - Button confirm to Next Screen
- (IBAction)btnMail:(UIButton *)sender
{
    if ([[infoData objectForKey:@"DtaExtenso"] isEqualToString:@""]) {
        [AppFunctions LOG_MESSAGE:@"Nenhuma data foi escolhida."
                          message:@"Para continuar, escolha uma data."
                           cancel:ERROR_BUTTON_CANCEL];
        return;
    }
    if ([valuePurchase isEqualToString:@"0.00"] ) {
        [AppFunctions LOG_MESSAGE:@"Nenhum quarto foi selecionado."
                          message:@"Para continuar, selecione pelo menos 1 quarto."
                           cancel:ERROR_BUTTON_CANCEL];
        return;
    }
    
    [HUD show:YES];
    HUD.labelText = @"Enviando Solicitação.";
    
    NSDictionary *user = [AppFunctions DATA_BASE_ENTITY_LOAD:TAG_USER_PERFIL];
    NSString *roonsText= @"";
    for (NSDictionary *tmp in roons) {
        if ([[tmp objectForKey:PACKAGE_INFO_ROOM_NUMBER]intValue] > 0) {
            
            NSString *roon = [NSString stringWithFormat:MAIL_PACKAGE_ROOM,
                              [tmp objectForKey:PACKAGE_INFO_ROOM_NUMBER],
                              [tmp objectForKey:@"DscTpoAcomodacao"],
                              [tmp objectForKey:@"SglMoeda"],
                              [tmp objectForKey:@"VlrVenda"]];
            roonsText = [NSString stringWithFormat:@"%@\n%@",roonsText, roon];
        }
    }
    
    roonsText = [NSString stringWithFormat:@"%@\n",roonsText];
    
    NSString *mail = [NSString stringWithFormat:MAIL_PACKAGE,
                      [user objectForKey:TAG_USER_PERFIL_NAME],
                      [infoCircuit objectForKey:@"NomProduto"],
                      [infoData objectForKey:@"DtaFormatada"],
                      roonsText,
                      [user objectForKey:TAG_USER_PERFIL_NAME],
                      [user objectForKey:TAG_USER_PERFIL_MAIL]];
    
    NSString *wsComplement = [NSString stringWithFormat:WS_URL_MAIL_SENDER,
                              IDWS,@"4",
                              [user objectForKey:TAG_USER_PERFIL_MAIL],
                              [seller objectForKey:TAG_USER_SELLER_MAIL],
                              @"myPota - Solicitação de Pacote",
                              mail,@"",@"" ];
    
    NSString *link = [NSString stringWithFormat:WS_URL, WS_URL_MAIL, wsComplement];
    
    [appConnection START_CONNECT:link timeForOu:15.f labelConnection:nil showView:NO block:^(NSData *result) {
        NSDictionary *allCitys = (NSDictionary *)[[AzParser alloc] xmlDictionary:result tagNode:TAG_SEND_MAIL];
        if (allCitys == NULL)
            [AppFunctions LOG_MESSAGE:@"E-Mail não enviado."
                              message:@"Não conseguimos enviar seu email, por favor tente mais tarde."
                               cancel:ERROR_BUTTON_CANCEL];
        
        else {
            for (NSDictionary *tmp in [allCitys objectForKey:TAG_SEND_MAIL])
                if ([[tmp objectForKey:TAG_SEND_MAIL] isEqualToString:TAG_SEND_MAIL_SUCCESS]) {
                    [AppFunctions LOG_MESSAGE:@"E-Mail enviado."
                                      message:@"Seu pedido foi enviado para seu agente de viagem."
                                       cancel:ERROR_BUTTON_CANCEL];
                    break;
                }
            //            [self.navigationController popViewControllerAnimated:YES];
        }
        [HUD hide:YES];
    }];
}

- (void)loadContract
{
    HUD.labelText = @"Carregando Contrato.";
    
    [appConnection START_CONNECT:linkGeneralConditions timeForOu:15.F labelConnection:nil showView:NO block:^(NSData *result) {
        if (result == nil) {
            [AppFunctions LOG_MESSAGE:ERROR_1013_TITLE
                              message:ERROR_1013_MESSAGE
                               cancel:ERROR_BUTTON_CANCEL];
        } else {
            NSDictionary *allError  = (NSDictionary *)[[AzParser alloc] xmlDictionary:result tagNode:@"Erro"];
            for (NSString *tmp in [allError objectForKey:@"CodErro"])
            {
                [AppFunctions LOG_MESSAGE:ERROR_1013_TITLE
                                  message:tmp
                                   cancel:ERROR_BUTTON_CANCEL];
                return;
            }
            NSDictionary *allPlans  = (NSDictionary *)[[AzParser alloc] xmlDictionary:result tagNode:@"string"];
            
            [purchaseData setObject:[allPlans objectForKey:@"string"] forKey:PURCHASE_INFO_PURCHASE_CONTRACT];
            
            [AppFunctions CLEAR_INFORMATION];
            [AppFunctions SAVE_INFORMATION:purchaseData
                                       tag:PURCHASE];
            [HUD hide:YES];
            [AppFunctions GO_TO_SCREEN:self destiny:SEGUE_P2_TO_R0];
            
        }
    }];
}

@end
