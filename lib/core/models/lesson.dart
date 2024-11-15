class Lesson {
  Lesson({
    required this.id,
    required this.title,
    required this.body,
  });

  final int id;
  final String title;
  final String body;
}

List<Lesson> lessonsList = [
  Lesson(
    id: 1,
    title: 'The Importance of Financial Literacy',
    body:
        'Introduction to Financial Literacy\n\nFinancial literacy is a crucial life skill that impacts our ability to achieve financial stability and security. Being financially literate means understanding how to manage money, make smart financial decisions, and plan for the future. With a solid foundation in personal finance, you can avoid common pitfalls such as overspending, unnecessary debt, and financial stress.\n\nWhy Financial Literacy Matters\n\nIn today’s fast-paced world, the landscape of personal finance is more complex than ever. Understanding concepts like interest rates, inflation, and credit can help you make informed decisions about your money. Financial literacy empowers you to take control of your financial future, make sound investments, and build a comfortable life for yourself and your family.',
  ),
  Lesson(
    id: 2,
    title: 'Understanding Budgeting and Financial Planning',
    body:
        'Creating a Budget\n\nA budget is a financial plan that helps you manage your income and expenses. It’s the foundation of financial success. By keeping track of your earnings and expenditures, you can identify areas where you may be overspending and find opportunities to save more.\n\nSteps to Create a Personal Budget:\n\n1. Calculate your total income (salary, freelance earnings, etc.).\n2. List your fixed expenses (rent, utilities, subscriptions).\n3. List your variable expenses (groceries, entertainment, travel).\n4. Set a savings goal (at least 10% of your income).\n5. Review and adjust your budget regularly.\n\nThe 50/30/20 Rule:\n50% of income on needs (rent, food).\n30% on wants (entertainment, dining out).\n20% on savings and debt repayment.',
  ),
  Lesson(
    id: 3,
    title: 'The Power of Saving and Investing',
    body:
        'Saving Money\n\nSaving is essential for building a financial safety net. Aim to save at least 10-20% of your income each month for emergencies, such as unexpected medical expenses or car repairs.\n\nTypes of Savings Accounts:\n\nEmergency Fund: A separate account for unexpected expenses.\n\nHigh-Interest Savings Account: Earns more interest than a regular account.\n\nInvesting for Growth\n\nInvesting is the key to growing your wealth over time. By putting your money into stocks, bonds, or mutual funds, you can earn a return on your investment. Remember, the earlier you start investing, the more time your money has to grow.\n\nInvestment Tips:\nDiversify your investments to reduce risk.\nInvest regularly, even if it’s a small amount.\nUnderstand the risks before investing.',
  ),
  Lesson(
    id: 4,
    title: 'Credit and Debt Management',
    body:
        'Understanding Credit\n\nCredit can be a powerful tool when used responsibly. It allows you to borrow money and pay it back over time. However, it’s important to understand the terms of credit agreements, including interest rates and fees.\n\nHow to Use Credit Wisely:\nPay off your credit card balance in full each month.\nAvoid carrying a high balance, which can lead to debt.\nCheck your credit score regularly.\n\nManaging Debt\n\nDebt is a reality for many people, but it doesn’t have to be a burden. Effective debt management involves creating a repayment plan and sticking to it.\n\nTips for Debt Management:\nPrioritize high-interest debts first (e.g., credit cards).\nMake extra payments whenever possible.\nAvoid taking on new debt until your current debt is under control.',
  ),
  Lesson(
    id: 5,
    title: 'Building Long-Term Wealth',
    body:
        'Setting Financial Goals\n\nTo achieve long-term financial success, you need clear financial goals. These might include buying a home, saving for retirement, or funding a child’s education. Setting specific, measurable, achievable, relevant, and time-bound (SMART) goals can help you stay on track.\n\nRetirement Planning\n\nPlanning for retirement should start as early as possible. Contributing to a retirement account, such as a 401(k) or IRA, can provide you with a steady income after you stop working.\n\nThe Power of Compound Interest\n\nCompound interest is the interest earned on both the initial amount and any interest already earned. It can significantly increase your savings and investments over time.\n\nExample: If you invest \$1,000 at an interest rate of 5%, after 10 years, your investment will grow to \$1,628 due to compound interest.',
  ),
];
