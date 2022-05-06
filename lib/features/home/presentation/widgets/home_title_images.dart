part of '../pages/home_screen.dart';

class _HomeTitleImages extends StatelessWidget {
  const _HomeTitleImages({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollingListImage(
          size: size,
          height: size.width * .6,
          width: size.width * .9,
          imageUrls: const [
            'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
            'https://media.istockphoto.com/photos/two-empty-wine-glasses-sitting-in-a-restaurant-on-a-warm-sunny-picture-id1018141890?k=20&m=1018141890&s=612x612&w=0&h=uMDP00MMIhlwQE77EEcoelc2oSKBT_B6avaXqtxgiow=',
            'https://huawei.ru/upload/iblock/31e/31eaec11dd323da24382d6b16397b968.jpg'
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              end: size.width * .075,
              start: size.width * .025,
              top: size.width * .025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * .25,
                height: size.width * .075,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent.shade100,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.orange,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1.5,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'Descover More >',
                    style: AppTextStyles.styleWeight400(
                      fontSize: size.width * .0225,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * .1,
                height: size.width * .1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(.6),
                ),
                child: Icon(
                  TrippoIcons.favorite,
                  color: Theme.of(context).errorColor,
                ),
              )
            ],
          ),
        ),
        PositionedDirectional(
          bottom: size.width * .04,
          start: size.width * .015,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Location',
                style: AppTextStyles.styleWeight900(
                    color: Colors.white, fontSize: size.width * .065),
              ),
              Text(
                'Syria . Aleppo',
                style: AppTextStyles.styleWeight900(
                    color: Colors.white, fontSize: size.width * .065),
              ),
              SizedBox(height: size.width * .025),
            ],
          ),
        ),
      ],
    );
  }
}
