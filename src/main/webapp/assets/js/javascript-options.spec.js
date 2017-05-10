describe("javascript options", function() {
    var $multiselect,
        $multiselect_to;

    beforeEach(function() {
        var html = '<div class="row">'+
            '    <div class="col-xs-5">'+
            '        <select name="from[]" class="js-multiselect form-control" size="8" multiple="multiple">'+
            '            <option value="1">Item 1</option>'+
            '            <option value="2">Item 5</option>'+
            '            <option value="2">Item 2</option>'+
            '            <option value="2">Item 4</option>'+
            '            <option value="3">Item 3</option>'+
            '        </select>'+
            '    </div>'+
            '    '+
            '    <div class="col-xs-2">'+
            '        <button type="button" id="js_right_All_1" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i></button>'+
            '        <button type="button" id="js_right_Selected_1" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>'+
            '        <button type="button" id="js_left_Selected_1" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>'+
            '        <button type="button" id="js_left_All_1" class="btn btn-block"><i class="glyphicon glyphicon-backward"></i></button>'+
            '    </div>'+
            '    '+
            '    <div class="col-xs-5">'+
            '        <select name="to[]" id="js_multiselect_to_1" class="form-control" size="8" multiple="multiple"></select>'+
            '    </div>'+
            '</div>';
    
        jasmine.getFixtures().set(html);
        
        $multiselect = $('.js-multiselect').multiselect({
            right: '#js_multiselect_to_1',
            rightAll: '#js_right_All_1',
            rightSelected: '#js_right_Selected_1',
            leftSelected: '#js_left_Selected_1',
            leftAll: '#js_left_All_1'
        });
        $multiselect_to = $('#js_multiselect_to_1');
    });

    it("multiselect is instantiated and contains options", function() {
        expect($multiselect.hasClass('js-multiselect')).toBe(true);
        expect($multiselect.find('option').length).toBe(5);

        expect($multiselect_to.attr('id')).toBe('js_multiselect_to_1');
        expect($multiselect_to.find('option').length).toBe(0);
    });

    it("move all to right", function() {
        // Click move all to right
        $('#js_right_All_1').trigger('click');

        expect($multiselect.find('option').length).toBe(0);
        expect($multiselect_to.find('option').length).toBe(5);
    });

    it("move one to right", function() {
        $multiselect.find('option:eq(0)').attr('selected', true);

        // Click move selected to right
        $('#js_right_Selected_1').trigger('click');

        expect($multiselect.find('option').length).toBe(4);
        expect($multiselect_to.find('option').length).toBe(1);
    });

    it("move all selected to right", function() {
        $multiselect.find('option:nth-child(2n)').attr('selected', true);

        // Click move selected to right
        $('#js_right_Selected_1').trigger('click');

        expect($multiselect.find('option').length).toBe(3);
        expect($multiselect_to.find('option').length).toBe(2);
    });

    it("move all to left", function() {
        // Click move all to right
        $('#js_right_All_1').trigger('click');

        // Click move all to left
        $('#js_left_All_1').trigger('click');

        expect($multiselect.find('option').length).toBe(5);
        expect($multiselect_to.find('option').length).toBe(0);
    });

    it("move one to left", function() {
        // Click move all to right
        $('#js_right_All_1').trigger('click');

        $multiselect_to.find('option:eq(0)').attr('selected', true);

        // Click move selected to right
        $('#js_left_Selected_1').trigger('click');

        expect($multiselect.find('option').length).toBe(1);
        expect($multiselect_to.find('option').length).toBe(4);
    });

    it("move all selected to left", function() {
        // Click move all to right
        $('#js_right_All_1').trigger('click');

        $multiselect_to.find('option:nth-child(2n)').attr('selected', true);

        // Click move selected to right
        $('#js_left_Selected_1').trigger('click');

        expect($multiselect.find('option').length).toBe(2);
        expect($multiselect_to.find('option').length).toBe(3);
    });
});


describe("javascript options", function() {
    var $multiselect1,
        $multiselect_to_2;

    beforeEach(function() {
        var html = '<div class="row">'+
            '    <div class="col-xs-5">'+
            '        <select name="from[]_1" class="js-multiselect1 form-control" size="8" multiple="multiple">'+
            '            <option value="1">Item 1</option>'+
            '            <option value="2">Item 5</option>'+
            '            <option value="2">Item 2</option>'+
            '            <option value="2">Item 4</option>'+
            '            <option value="3">Item 3</option>'+
            '        </select>'+
            '    </div>'+
            '    '+
            '    <div class="col-xs-2">'+
            '        <button type="button" id="js_right_All_1" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i></button>'+
            '        <button type="button" id="js_right_Selected_1" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>'+
            '        <button type="button" id="js_left_Selected_1" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>'+
            '        <button type="button" id="js_left_All_1" class="btn btn-block"><i class="glyphicon glyphicon-backward"></i></button>'+
            '    </div>'+
            '    '+
            '    <div class="col-xs-5">'+
            '        <select name="to[]_1" id="js_multiselect_to_2" class="form-control" size="8" multiple="multiple"></select>'+
            '    </div>'+
            '</div>';
    
        jasmine.getFixtures().set(html);
        
        $multiselect1 = $('.js-multiselect1').multiselect({
            right: '#js_multiselect_to_2',
            rightAll: '#js_right_All_1',
            rightSelected: '#js_right_Selected_1',
            leftSelected: '#js_left_Selected_1',
            leftAll: '#js_left_All_1'
        });
        $multiselect_to_2 = $('#js_multiselect_to_2');
    });

    it("multiselect is instantiated and contains options", function() {
        expect($multiselect1.hasClass('js-multiselect1')).toBe(true);
        expect($multiselect1.find('option').length).toBe(5);

        expect($multiselect_to_2.attr('id')).toBe('js_multiselect_to_2');
        expect($multiselect_to_2.find('option').length).toBe(0);
    });

    it("move all to right", function() {
        // Click move all to right
        $('#js_right_All_1').trigger('click');

        expect($multiselect1.find('option').length).toBe(0);
        expect($multiselect_to_2.find('option').length).toBe(5);
    });

    it("move one to right", function() {
        $multiselect1.find('option:eq(0)').attr('selected', true);

        // Click move selected to right
        $('#js_right_Selected_1').trigger('click');

        expect($multiselect1.find('option').length).toBe(4);
        expect($multiselect_to_2.find('option').length).toBe(1);
    });

    it("move all selected to right", function() {
        $multiselect1.find('option:nth-child(2n)').attr('selected', true);

        // Click move selected to right
        $('#js_right_Selected_1').trigger('click');

        expect($multiselect1.find('option').length).toBe(3);
        expect($multiselect_to_2.find('option').length).toBe(2);
    });

    it("move all to left", function() {
        // Click move all to right
        $('#js_right_All_1').trigger('click');

        // Click move all to left
        $('#js_left_All_1').trigger('click');

        expect($multiselect1.find('option').length).toBe(5);
        expect($multiselect_to_2.find('option').length).toBe(0);
    });

    it("move one to left", function() {
        // Click move all to right
        $('#js_right_All_1').trigger('click');

        $multiselect_to_2.find('option:eq(0)').attr('selected', true);

        // Click move selected to right
        $('#js_left_Selected_1').trigger('click');

        expect($multiselect1.find('option').length).toBe(1);
        expect($multiselect_to_2.find('option').length).toBe(4);
    });

    it("move all selected to left", function() {
        // Click move all to right
        $('#js_right_All_1').trigger('click');

        $multiselect_to_2.find('option:nth-child(2n)').attr('selected', true);

        // Click move selected to right
        $('#js_left_Selected_1').trigger('click');

        expect($multiselect1.find('option').length).toBe(2);
        expect($multiselect_to_2.find('option').length).toBe(3);
    });
});

