require 'csv'
require 'pry'
count={}
i=1
cost=nil
report={} 
quantity={}

light={}

s_total=[]
selection=nil
change=0
amount={}
total={}
chosen_amount=nil

CSV.foreach('/Users/robeltezera/Dropbox/launchacademy/cashier_3/products.csv', headers: true) do |row|
	puts "#{i}) Add Item - #{row[3].to_i} - #{row[1]}"
   # { identifyingquality => [alloftherestofthedata, brokenupinanarray]}

	count[i]={retail_price:"#{row[3].to_f}",name: "#{row[1].to_s}",sku: "#{row[0].to_f}",whole_price: "#{row[2].to_f}"}
	i=i+1	
end
	puts "4) Complete Sale"
	puts "5) Reporting"
def subtotal(cost1, amount)
		cost1*amount
end

def add_all(products)
	products.inject(0) { |total, (k, v)| total + v.last }
end

def promt (somenumber)
 	somenumber=gets.chomp.to_i
end

def bracket_selection (number)
	cost=count[number][:retail_price].to_f
	subtotal(cost,chosen_amount)
	quantity[number]<<chosen_amount.to_i
	light[number]<<subtotal(cost, chosen_amount).to_i
	s_total<<subtotal(cost, chosen_amount).to_i
end
def to_find_each_total(number2)
		total[number2]=add_all(light[number]).to_i
end

def to_find_the_amount(number3)
	amount[number3]=add_all(quantity[number]).to_i
end

def input_checker(input)
	regex=/\d/
	if regex=-input.to_i
		puts "Great!!"
	else
		puts "Invalid Entry"
	end
end

while selection != 4 || selection != 5
	puts 'Make a selection:'
	selection=promt (selection)
	input_checker(selection)

	puts 'How many?'
	chosen_amount=promt (chosen_amount)
	input_checker(chosen_amount)

	if selection.to_i==1
		bracket_selection(1)
		to_find_each_total(1)
		to_find_the_amount(1)	
	
	elsif selection.to_i==2
		bracket_selection(2)
		to_find_each_total(2)
		to_find_the_amount(2)
	elsif selection.to_i==3
		bracket_selection(3)
		to_find_each_total(3)
		to_find_the_amount(3)
		
	elsif selection.to_i==4
		puts "==========Sale Complete============="
		puts "#{report}"
		print "What is the amount tendered?"
		promt(tender)
		change=(tender-add_all(s_total)).to_i
		puts "========Thank You!================="
		puts "The total change due is: #{change}"
		puts "Subtotal: #{add_all(s_total)} "
		break
	elsif selection.to_i==5
		CSV.open("/Users/robeltezera/Dropbox/launchacademy/cashier_3/report.csv",  "wb") do |csv|
  			csv << "#{report}"
 		end
  		break
	end


	puts "Subtotal: #{add_all(s_total)} "
	report=[{sku: " ", name: "#{count[1][:retail_price]}", quantity: "#{amount[1]}", revenue: "#{total[1]}", profit: ' '},
			{sku: " ", name: "#{count[2][:retail_price]}", quantity: "#{amount[2]}", revenue: "#{total[2]}", profit: ' '},	
			{sku: " ", name: "#{count[3][:retail_price]}", quantity: "#{amount[3]}", revenue: "#{total[3]}", profit: ' '}]

end
	






























































	














