//
//  ProductCategoryListViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "ProductCategoryListViewController.h"
#import "ProductListTableViewCell.h"
#import "ProductItemCell.h"

#define NUM_TOP_ITEMS 20
#define NUM_SUBITEMS 4

@interface ProductCategoryListViewController (){
    NSArray *topItems;
    NSArray *topItemsText;
    NSMutableArray *subItems; // array of arrays
    NSInteger currentExpandedIndex;
    NSMutableIndexSet *expandedSections;
}
@property(nonatomic, assign) BOOL isMenwear;

@end

@implementation ProductCategoryListViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    if (!expandedSections) {
        expandedSections = [[NSMutableIndexSet alloc] init];
    }
    topItems = [[NSArray alloc] initWithArray:[self topLevelItems]];
    topItemsText = [[NSArray alloc] initWithArray:[self menTopLevelItems]];
    subItems = [NSMutableArray new];
    currentExpandedIndex = -1;
    
    for (int i = 0; i <= [topItems count]; i++) {
        switch (i) {
            case 0:
                [subItems addObject:[self menCollectionSubItems]];
                break;
            case 1:
                [subItems addObject:[self womenCollectionSubItems]];
                break;
            case 2:
                [subItems addObject:[self childrenCollectionSubItems]];
                break;
            case 3:
                [subItems addObject:[self allTypeCollectionSubItems]];
                break;
            default:
                break;
        }
    }

}

#pragma mark - Data generators

- (NSArray *)topLevelItems {
    NSArray *items;
    
    if (self.isMenwear) {
        items = @[
                  @"menshirts.png",
                  @"menpants.png",
                  @"menshoes.png",
                  @"menaccessories.png"
                  ];
    } else {
        items = @[
                  @"womentopwear.png",
                  @"womenbottomwear.png",
                  @"womenfootwear.png",
                  @"womenaccessories.png"
                  ];
    }
    return items;
}

- (NSArray *)menTopLevelItems {
    NSArray *items = @[ @"Men", @"Women", @"Children", @"All" ];
    return items;
}

- (NSArray *)menCollectionSubItems {
    NSArray *sItems;
        sItems = @[
                   @"Rings",
                   @"Chains",
                   @"Bracelite",
                   @"Ear rings",
                   @"Pendants",
                   @"Coins"
                   ];
    return sItems;
}

- (NSArray *)womenCollectionSubItems {
    NSArray *sItems;
    sItems = @[
               @"Rings",
               @"Chains",
               @"Bracelite",
               @"Ear rings",
               @"Pendants",
               @"Coins",
               @"God idols",
               @"Mangal Sutra",
               @"Wedding special",
               @"Daily wears",
               @"Party wears",
               @"Traditional",
               @"Fasion"
               ];
    return sItems;
}

- (NSArray *)childrenCollectionSubItems {
    NSArray *sItems;
    sItems = @[
               @"Rings",
               @"Chains",
               @"Bracelite",
               @"Ear rings",
               @"Pendants",
               @"New collections"
               ];
    return sItems;
}

- (NSArray *)allTypeCollectionSubItems {
    NSArray *sItems;
    sItems = @[
               @"Rings",
               @"Chains",
               @"Bracelite",
               @"Ear rings",
               @"Pendants",
               @"Coins",
               @"God idols",
               @"Mangal Sutra",
               @"Wedding special",
               @"Daily wears",
               @"Party wears",
               @"Traditional",
               @"Fasion",
               @"New collections",
               @"Antique"
               ];
    return sItems;
}

#pragma mark - View management


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [topItems count];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section {
    CGFloat headerHeight = 60.0f;
    return headerHeight;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    if ([self tableView:tableView canCollapseSection:section]) {
        if ([expandedSections containsIndex:section]) {
            return [[subItems objectAtIndex:section] count];
        }
    }
    return 0;
}

- (BOOL)tableView:(UITableView *)tableView
canCollapseSection:(NSInteger)section {
    if (section >= 0)
        return YES;
    
    return NO;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ProductItemCell *productCell = (ProductItemCell *)
    [tableView dequeueReusableCellWithIdentifier:@"ProductItem"];
    productCell.productType.text = [topItemsText objectAtIndex:section];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 320, 100)];
    [btn setTag:section];
    [productCell addSubview:btn];
    [btn addTarget:self
            action:@selector(sectionTapped:)
    forControlEvents:UIControlEventTouchDown];
    return productCell;
}

- (void)sectionTapped:(UIButton *)button {
    NSInteger sectionIndex = button.tag;
    BOOL currentlyExpanded = [expandedSections containsIndex:sectionIndex];
    //  [self.tableView beginUpdates];
    if ([self tableView:self.tableView canCollapseSection:sectionIndex]) {
        NSInteger rows;
        NSMutableArray *tmpArray = [NSMutableArray array];
        if (currentlyExpanded) {
            rows = [self tableView:self.tableView numberOfRowsInSection:sectionIndex];
            [expandedSections removeIndex:sectionIndex];
            
        } else {
            [expandedSections addIndex:sectionIndex];
            rows = [self tableView:self.tableView numberOfRowsInSection:sectionIndex];
        }
        
        for (int i = 0; i < rows; i++) {
            NSIndexPath *tmpIndexPath =
            [NSIndexPath indexPathForRow:i inSection:sectionIndex];
            [tmpArray addObject:tmpIndexPath];
        }
        if (currentlyExpanded) {
            [self.tableView deleteRowsAtIndexPaths:tmpArray
                                  withRowAnimation:UITableViewRowAnimationTop];
            
        } else {
            [self.tableView insertRowsAtIndexPaths:tmpArray
                                  withRowAnimation:UITableViewRowAnimationTop];
        }
    }
    //  [self.tableView endUpdates];
    [self.tableView reloadData];
    NSIndexPath *indexPath =
    [NSIndexPath indexPathForRow:NSNotFound inSection:sectionIndex];
    [self.tableView scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionTop
                                  animated:YES];
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"ProductList" sender:nil];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  ProductListTableViewCell *cell = (ProductListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  cell.categoryTitleLabel.text = [[subItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];;
    cell.categoryTitleLabel.textColor = [UIColor blackColor];
    cell.contentView.backgroundColor = [UIColor whiteColor];

  return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
